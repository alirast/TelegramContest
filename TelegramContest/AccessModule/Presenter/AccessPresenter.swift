//
//  AccessPresenter.swift
//  TelegramContest
//
//  Created by N S on 27.03.2023.
//

import Foundation

//protocol for view
//if button pressed once - title changes forever
protocol AccessViewProtocol: AnyObject {
    func showNewTitles()
}

class AccessPresenter {
    weak var accessView: AccessViewProtocol?
    
    init(accessView: AccessViewProtocol) {
        self.accessView = accessView
    }
    
    //from presenter to view controller
    func setAccessTitles() {
//from access module presenter to router showGrid
//FIXME: - here should be router
        accessView?.showNewTitles()
    }
}
