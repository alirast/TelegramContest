//
//  ModuleBuilder.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
import Photos

class ModuleBuilder: ModuleBuilderProtocol {
    func createAccessModule(router: RouterProtocol) -> UIViewController {
        let view = AccessViewController()
        let presenter = AccessPresenter(accessView: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createPhotoGridModule(router: RouterProtocol) -> UIViewController {
        let photoGridView = PhotoGridViewController()
        let photoService = PhotoService()
        let photoGridPresenter = PhotoGridPresenter(photoGridView: photoGridView, photoService: photoService, router: router)
        photoGridView.presenter = photoGridPresenter
        return photoGridView
    }

    func createDrawingModule(photo: PHAsset?, router: RouterProtocol) -> UIViewController {
//TODO: - create presenter
        let drawingView = DrawingViewController()
        let photoService = PhotoService()
        let drawingPresenter = DrawingPresenter(view: drawingView, photoService: photoService, router: router, photo: photo)
        drawingView.presenter = drawingPresenter
        return drawingView
    }

}
