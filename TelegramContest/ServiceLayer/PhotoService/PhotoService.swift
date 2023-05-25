//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import UIKit
import Photos

class Service: ServiceProtocol {
    func getPictures(completion: @escaping ([PHAsset]) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                var assetArray = [PHAsset]()
                assets.enumerateObjects { (object, _, _) in
                    assetArray.append(object)
                }
                assetArray.reverse()
                completion(assetArray)
            } else {
                DispatchQueue.main.async {
                    self.showAlert()
                }
                
            }
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Warning", message: "Sorry, you can't use the app without allowing access to your photos. Please, go into your app privacy settings and allow access.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
}
