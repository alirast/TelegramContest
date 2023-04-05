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

protocol AccessPresenterProtocol: AnyObject {
    init(accessView: AccessViewProtocol, router: RouterProtocol)
    func setAccessTitles()
}

class AccessPresenter: AccessPresenterProtocol {
    weak var accessView: AccessViewProtocol?
    //not weak reference
    var router: RouterProtocol?
    required init(accessView: AccessViewProtocol, router: RouterProtocol) {
        self.accessView = accessView
        self.router = router
    }
    
    //from presenter to view controller
    func setAccessTitles() {
//from access module presenter to router showGrid
//TODO: - router function finish
        router?.showPhotoGrid()
        accessView?.showNewTitles()
    }
}
