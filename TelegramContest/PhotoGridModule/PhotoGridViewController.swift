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
    var collectionView = UICollectionView()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        getPhotos()
    }
    //MARK: - viewDidAppear
    //with correct layout for collection view
    override func viewDidAppear(_ animated: Bool) {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: UICollectionViewFlowLayout())
        //FIXME: - dont need background color if app mode is dark
        collectionView.backgroundColor = .black
        //collectionView.dataSource = self
        //collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    //MARK: - createCollectionView
    func createCollectionView() {
        
    }
    //MARK: - getPhotos
    func getPhotos() {
        let imageManager = PHImageManager.default()
        //what kind of pics we need
        let requestOptions = PHImageRequestOptions()
        //not synchronous - no need to wait
        requestOptions.deliveryMode = .highQualityFormat
        
        //how to sort them - by date, for example
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        if fetchResult.count > 0 {
            for i in 0..<fetchResult.count {
                imageManager.requestImage(for: fetchResult.object(at: i) as! PHAsset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOptions) { (image, error) in
                    self.imageArray.append(image ?? UIImage())
                }
            }
        } else {
            //FIXME: - alert or go to settings?
            print("no pics")
        }
    }
}

extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}

//FIXME: - if still low quality - 1. PHFetchAsset 2.PHAsset + memory warning
