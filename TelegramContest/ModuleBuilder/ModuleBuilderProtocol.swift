//
//  ModuleBuilderProtocol.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import UIKit
import Photos

protocol ModuleBuilderProtocol {
    func createAccessModule(router: RouterProtocol) -> UIViewController
    func createPhotoGridModule(router: RouterProtocol) -> UIViewController
//TODO: - give a picture from photoGridVC to drawingVC in parameters
    func createDrawingModule(photo: PHAsset?, router: RouterProtocol) -> UIViewController
}
