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
    init(photoGridView: PhotoGridViewProtocol, router: RouterProtocol)
    func getPictures()
    //to give picture from didSelect to drawingVC
    func tapOnThePicture(picture: PHAsset?)
}

class PhotoGridPresenter: PhotoGridPresenterProtocol {
    weak var photoGridView: PhotoGridViewProtocol?
    var router: RouterProtocol?
    var pictures: [PHAsset]?
    
    
    required init(photoGridView: PhotoGridViewProtocol, router: RouterProtocol) {
        self.photoGridView = photoGridView
        self.router = router
        getPictures()
    }
    
    //get photos should be in presenter - here
//TODO: - special class
    func getPictures() {
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
