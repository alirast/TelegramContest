//
//  ModuleBuilder.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
protocol ModuleBuilderProtocol {
    func createAccessModule(router: RouterProtocol) -> UIViewController
    func createPhotoGridModule(router: RouterProtocol) -> UIViewController
//TODO: - give a picture from photoGridVC to drawingVC in parameters
    func createDrawingModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createAccessModule(router: RouterProtocol) -> UIViewController {
        let view = AccessViewController()
        let presenter = AccessPresenter(accessView: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createPhotoGridModule(router: RouterProtocol) -> UIViewController {
//FIXME: - should go to presenter not to controller
        let photoGridView = PhotoGridViewController()
        let photoService = PhotoService()
        let photoGridPresenter = PhotoGridPresenter(photoGridView: photoGridView, photoService: photoService, router: router)
        photoGridView.presenter = photoGridPresenter
        return photoGridView
    }

    func createDrawingModule(router: RouterProtocol) -> UIViewController {
//TODO: - create presenter
        let drawingView = DrawingViewController()
        return drawingView
    }

}
