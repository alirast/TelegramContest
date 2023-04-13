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
        //photoService.getPhotos()
//FIXME: - first - accessed and then after else - denied
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            print(status)
            if status == .denied || status == .restricted {
                DispatchQueue.main.async {
                    
                }
            } else {
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { (object, _, _) in
                    print(object)
                    //pictures?.append(object)
                }
                //pictures?.reverse()
                //update ui on main thread
                DispatchQueue.main.async {
                    
                    //self?.collectionView.reloadData()
                }
            }
        }
    }

    
    func tapOnThePicture(picture: PHAsset?) {
        
    }
}
