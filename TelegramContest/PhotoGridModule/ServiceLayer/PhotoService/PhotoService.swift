//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import Foundation
import Photos

protocol PhotoServiceProtocol {
    func requestAuthorization(completion: @escaping (Bool) -> Void)
    func getPhotos(completion: @escaping ([PHAsset]) -> Void)
}
class PhotoService: PhotoServiceProtocol {
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            print(status)
            DispatchQueue.main.async {
                if status == .denied || status == .restricted {
                    completion(false)
                    //showAlert
                } else {
                    completion(true)
                }
            }
        }
    }

    func getPhotos(completion: @escaping ([PHAsset]) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        var assetArray = [PHAsset]()
        assets.enumerateObjects { (object, _, _) in
            print(object)
            assetArray.append(object)
        }
        completion(assetArray)
    }
}
