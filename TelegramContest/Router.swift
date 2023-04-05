//
//  Router.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
//requirements for all the classes
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set } //assembly
}

//for particular router
protocol RouterProtocol: RouterMain {
//FIXME: - back to access or to photoGrid?
    func accessViewController()
    func showPhotoGrid()
    func drawingViewController()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func accessViewController() {
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
    func drawingViewController() {
        
    }
}
//TODO: - methods of showing pictures in router (should create secondVC)
//need navigation controller to go back to photoVC from drawingVC

