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
    var pictures: [PHAsset]? { get set }
    init(photoGridView: PhotoGridViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol)
    func getPhotos()
//TODO: - give picture from didSelect to drawingVC
    func tapOnThePicture(picture: PHAsset?)
}
