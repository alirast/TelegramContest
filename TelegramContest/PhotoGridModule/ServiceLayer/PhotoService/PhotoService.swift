//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import Foundation
import Photos

 protocol PhotoServiceProtocol {
    func getPhotos(completion: @escaping ([PHAsset]) -> Void)
}

class PhotoService: PhotoServiceProtocol {
    func requestAuthorization() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                print("STATUS: \(status)")
                if status == .denied || status == .restricted {
                    //showAlert
                    print("not allowed")
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
}
