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
            assetArray.append(object)
        }
//FIXME: - problem is asset array is empty for the first access
        DispatchQueue.main.async {
            completion(assetArray)
            print(assetArray.count)
        }
    } 
    func showAlert() {
        let alertController = UIAlertController(title: "Warning", message: "Sorry, you can't use the app without allowing access to your photos. Please, go into your app privacy settings and allow access.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
}
