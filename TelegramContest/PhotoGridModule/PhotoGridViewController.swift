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
//TODO: - convert PHAsset to UIIMage for drawing canvas
//TODO: - presenter for PhotoGridViewController for router (for drawingVC)
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
        //FIXME: - dont need background color if app mode is dark
        collectionView.backgroundColor = .black
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
//MARK: - getPhotos
    /*func getPhotos() {
//FIXME: - first - accessed and then after else - denied
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            print(status)
            if status == .denied || status == .restricted {
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            } else {
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { (object, _, _) in
                    print(object)
                    //self?.imageArray.append(object)
                }
                //self?.imageArray.reverse()
                //update ui on main thread
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }*/
//MARK: - showAlert
//TODO: - add handler (which one?)
    func showAlert() {
        let alertController = UIAlertController(title: "Warning", message: "Sorry, you can't use the app without allowing access to your photos.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
//MARK: - extensionDataSource
extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.pictures?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        //get particular asset for particular index
        //let asset = self.imageArray[indexPath.row]
        //maybe item here
        guard let asset = presenter.pictures?[indexPath.row] else { return UICollectionViewCell() }
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
//TODO: - transition to drawingVC (through presenter and router, not through present(_:animated:)
        let picture = presenter.pictures?[indexPath.row]
        presenter.tapOnThePicture(picture: picture)
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

