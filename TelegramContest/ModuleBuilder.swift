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
