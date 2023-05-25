//
//  PhotoGridViewController.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
import Photos

//everything for view
class PhotoGridViewController: UIViewController, UICollectionViewDelegate, PhotoGridViewProtocol {

    var presenter: PhotoGridPresenterProtocol!
    var imageArray = [PHAsset]()
    var collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        presenter.getPhotos()
    }
    
//MARK: - createCollectionView
    func createCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
    }
    
    func showPhotos(_ photos: [PHAsset]) {
        self.imageArray = photos
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
//MARK: - extensionDataSource
extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        //get particular asset for particular index
        let asset = imageArray[indexPath.row]
        //get image from the asset because asset is not an image yet
        //converting to UIImage
        let manager = PHImageManager.default()
        manager.requestImage(for: asset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: nil) { (image, _) in
            //update ui on main thread
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pic = imageArray[indexPath.row]
        presenter.tapOnThePicture(picture: pic)
    }
}
//MARK: - extensionDelegateFlowLayout
extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //minus 1 to remove middle img
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

