//
//  PhotoService.swift
//  TelegramContest
//
//  Created by N S on 13.04.2023.
//

import Foundation
import Photos

protocol PhotoServiceProtocol {
    func getPhotos()
}
class PhotoService: PhotoServiceProtocol {
    func getPhotos() {
        PHPhotoLibrary.requestAuthorization { status in
            print(status)
            if status == .denied || status == .restricted {
                DispatchQueue.main.async {
                    //showAlert
                }
            } else {
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { (object, _, _) in
                    print(object)
                    //imageArray.append(object)
                }
                //imageArray.reverse()
                DispatchQueue.main.async {
                    //collectionView.reloadData()
                }
            }
            
        }
    }
}
