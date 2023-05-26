//
//  PhotoGridPresenter.swift
//  TelegramContest
//
//  Created by N S on 12.04.2023.
//

import Photos
import UIKit

class PhotoPresenter: PhotoGridPresenterProtocol {
    
    weak var photoGridView: PhotoGridViewProtocol?
    var router: RouterProtocol?
    let photoService: PhotoServiceProtocol
    
    required init(photoGridView: PhotoGridViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol) {
        self.photoGridView = photoGridView
        self.photoService = photoService
        self.router = router
    }
    
    func getPhotos() {
        photoService.getPictures { [weak self] pics in
            self?.photoGridView?.showPhotos(pics)
        }
    }
    
    func tapOnThePicture(picture: PHAsset?) {
        router?.showDrawingView(photo: picture)
    }
}
