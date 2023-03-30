//
//  Router.swift
//  TelegramContest
//
//  Created by N S on 30.03.2023.
//

import UIKit
//requirements for all the classes
protocol RouterMain {
    
}

//for special router
protocol RouterProtocol: RouterMain {
//FIXME: - back to access or to photoGrid?
    func accessViewController()
    func showPhotoGrid()
    func drawingViewController()
}
