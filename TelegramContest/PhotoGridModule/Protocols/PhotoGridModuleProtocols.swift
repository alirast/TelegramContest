//
//  PhotoGirdModuleProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import Foundation
import Photos

//protocol for view
protocol PhotoGridViewProtocol: AnyObject {
    func showPhotos(_ photos: [PHAsset])
}

//protocol for presenter
protocol PhotoGridPresenterProtocol: AnyObject {
    init(photoGridView: PhotoGridViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol)
    func getPhotos()
    func tapOnThePicture(picture: PHAsset?)
}
