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
    //to give picture from didSelect to drawingVC
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
    
    //get photos should be in presenter - here
    func getPhotos() {
//FIXME: - getPhotos nil for presenter
        photoService.getPhotos { [weak self] assets in
            self?.photoGridView?.showPhotos(assets)
        }
    }

    func tapOnThePicture(picture: PHAsset?) {
        
    }
}
