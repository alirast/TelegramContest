//
//  PhotoServiceProtocol.swift
//  TelegramContest
//
//  Created by N S on 24.04.2023.
//

import Foundation
import Photos

protocol PhotoServiceProtocol {
    func getPictures(completion: @escaping ([PHAsset]) -> Void)
}


