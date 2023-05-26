//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import Foundation
import Photos

class PhotoService: PhotoServiceProtocol {
    func getPictures(completion: @escaping ([PHAsset]) -> Void, error: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                var assetArray = [PHAsset]()
                assets.enumerateObjects { (object, _, _) in
                    assetArray.append(object)
                }
                completion(assetArray)
            } else {
                DispatchQueue.main.async {
                    error()
                }
                
            }
        }
    }
}
