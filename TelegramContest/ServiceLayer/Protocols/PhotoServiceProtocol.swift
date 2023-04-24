//
//  PhotoServiceProtocol.swift
//  TelegramContest
//
//  Created by N S on 24.04.2023.
//

import Foundation
import Photos

//photoService protocol
protocol PhotoServiceProtocol {
    func getPhotos(completion: @escaping ([PHAsset]) -> Void)
}
