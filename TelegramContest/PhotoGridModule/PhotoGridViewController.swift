//
//  PhotoGridViewController.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
import Photos

class PhotoGridViewController: UIViewController {
    var imageArray = [UIImage]()
//FIXME: collection view setting up
    let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    
//MARK: - getPhotos
    func getPhotos() {
        let imageManager = PHImageManager.default()
    }
}
