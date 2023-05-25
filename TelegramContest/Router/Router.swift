//
//  Router.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
import Photos

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func showAccessViewController() {
        if let navigationController = navigationController {
            guard let accessViewController = moduleBuilder?.createAccessModule(router: self) else { return }
            navigationController.viewControllers = [accessViewController]
        }
    }
    
    func showPhotoGrid() {
        if let navigationController = navigationController {
            guard let photoGridViewController = moduleBuilder?.createPhotoGridModule(router: self) else { return }
            navigationController.pushViewController(photoGridViewController, animated: true)
        }
    }
    
    func showDrawingView(photo: PHAsset?) {
        if let navigationController = navigationController {
            guard let drawingViewController = moduleBuilder?.createDrawingModule(photo: photo, router: self) else { return }
            navigationController.pushViewController(drawingViewController, animated: true)
        }
    }
}
