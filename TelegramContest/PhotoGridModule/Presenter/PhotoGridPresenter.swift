//
//  PhotoGridPresenter.swift
//  TelegramContest
//
//  Created by N S on 12.04.2023.
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

class PhotoGridPresenter: PhotoGridPresenterProtocol {
    //link to view
    weak var photoGridView: PhotoGridViewProtocol?
    var router: RouterProtocol?
    let photoService: PhotoServiceProtocol
    var pictures: [PHAsset]?

    required init(photoGridView: PhotoGridViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol) {
        self.photoGridView = photoGridView
        self.photoService = photoService
        self.router = router
        getPhotos()
    }
    
    func getPhotos() {
//TODO: - maybe here should be requestAuthorization from photoService?
        photoService.getPhotos { [weak self] assets in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.pictures = assets
                self.photoGridView?.showPhotos(assets)
            }
        }
    }

    func tapOnThePicture(picture: PHAsset?) {
        
    }
}
