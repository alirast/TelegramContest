//
//  RouterProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import UIKit
import Photos

//TODO: - navigation controller to go back to photoVC or drawingVC
//requirements for all the classes
protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set } //assembly
}

protocol RouterProtocol: RouterMainProtocol {
//TODO: - back to access or to photoGrid
    func accessViewController()
    func showPhotoGrid()
    func showDrawingView(photo: PHAsset?)
}

