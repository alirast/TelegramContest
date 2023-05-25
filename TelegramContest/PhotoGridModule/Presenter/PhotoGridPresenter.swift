//
//  PhotoGridPresenter.swift
//  TelegramContest
//
//  Created by N S on 12.04.2023.
//

import Photos
import UIKit

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
        photoService.getPhotos { [weak self] assets in
            //if self was deleted - nil
            guard let self = self else { return }
//problem
            DispatchQueue.main.async {
                self.pictures = assets
                self.photoGridView?.showPhotos(assets)
            }
        }
    }

    func tapOnThePicture(picture: PHAsset?) {
        router?.showDrawingView(photo: picture)
      
    }
}
