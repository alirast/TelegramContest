//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import UIKit
import Photos

class PhotoService: PhotoServiceProtocol {
    func requestAuthorization() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                print("STATUS: \(status)")
                if status == .denied || status == .restricted {
                    print("not allowed")
                    self.showAlert()
                } else {
                    print("allowed")
                }
            }
        }
    }

    func getPhotos(completion: @escaping ([PHAsset]) -> Void) {
        requestAuthorization()
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        var assetArray = [PHAsset]()
        assets.enumerateObjects { (object, _, _) in
            //print("OBJECT: \(object)")
            assetArray.append(object)
        }
        DispatchQueue.main.async {
            completion(assetArray)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Warning", message: "Sorry, you can't use the app without allowing access to your photos.", preferredStyle: .alert)
//FIXME: - go to settings of the app in phone settings
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
}
