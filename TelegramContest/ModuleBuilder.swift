//
//  ModuleBuilder.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
protocol ModuleBuilderProtocol {
    func createAccessModule(router: RouterProtocol) -> UIViewController
    func createPhotoGridModule(photo: Photo, router: RouterProtocol) -> UIViewController
    func createDrawingModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {

    
    func createAccessModule(router: RouterProtocol) -> UIViewController {
        let view = AccessViewController()
        let presenter = AccessPresenter(accessView: view) //router
        view.presenter = presenter
        return view
    }
    
    func createPhotoGridModule(photo: Photo, router: RouterProtocol) -> UIViewController {
        let view = PhotoGridViewController()
        //without presenter
        //model?
        return view
    }

    func createDrawingModule(router: RouterProtocol) -> UIViewController {
        return UIViewController()
    }

}
