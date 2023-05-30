//
//  PHAssetExtension.swift
//  TelegramContest
//
//  Created by N S on 24.04.2023.
//

import UIKit
import Photos

extension PHAsset {
    func convertToImage(completion: @escaping (_ image: UIImage?) -> Void) {
        let manager = PHImageManager.default()
        manager.requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil) { (image, _) in
            completion(image)
        }
    }
}
