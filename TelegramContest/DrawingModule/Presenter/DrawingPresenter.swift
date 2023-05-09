//
//  DrawingPresenter.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import Foundation
import Photos

class DrawingPresenter: DrawingPresenterProtocol {
    weak var drawingView: DrawingViewProtocol?
    var router: RouterProtocol?
    let photoService: PhotoServiceProtocol!
//FIXME: - UIImage, not PHAsset
    var photo: PHAsset?
    
    required init(view: DrawingViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol, photo: PHAsset?) {
        self.drawingView = view
        self.photoService = photoService
        self.router = router
        self.photo = photo
    }
    
    func setPhoto() {
        self.drawingView?.setPhoto(photo: photo)
    }
    
    func undoAction() {
        router?.showPhotoGrid()
    }
}
