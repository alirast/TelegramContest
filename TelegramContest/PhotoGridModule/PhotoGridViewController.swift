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
    let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    
//MARK: - viewDidLoad
//FIXME: - setting ui not in view did load
    override func viewDidLoad() {
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        getPhotos()
    }
    
//MARK: - getPhotos
    func getPhotos() {
        let imageManager = PHImageManager.default()
    }
//MARK: - openPrivacySettings
//FIXME: - details?
    func openPrivacySettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { assertionFailure("Not able to open app privacy settings."); return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
