//
//  DrawingModuleProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import Foundation
import Photos

//protocol for view
protocol DrawingViewProtocol: AnyObject {
    func setPhoto(photo: PHAsset?)
}

//protocol for presenter
protocol DrawingPresenterProtocol: AnyObject {
    init(view: DrawingViewProtocol, photoService: PhotoServiceProtocol, router: RouterProtocol, photo: PHAsset?)
    func setPhoto()
}
