//
//  RouterProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import UIKit
import Photos

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set } //assembly
}

protocol RouterProtocol: RouterMainProtocol {
    func showAccessViewController()
    func showPhotoGrid()
    func showDrawingView(photo: PHAsset?)
}

