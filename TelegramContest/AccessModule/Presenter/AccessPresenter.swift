//
//  AccessPresenter.swift
//  TelegramContest
//
//  Created by N S on 27.03.2023.
//

import Foundation

//protocol for presenter
protocol AccessViewPresenterProtocol: AnyObject {
    func setAccessTitles()
}

//protocol for view
//if button pressed once - title changes forever
protocol AccessViewProtocol: AnyObject {
    func showNewTitles(_ condition: Bool)
}

class AccessPresenter: AccessViewPresenterProtocol {
    //link for view through protocol
    weak var accessView: AccessViewProtocol!
    //link for model - directly
    var accessModel: AccessModel!
    
    func setAccessTitles() {
        //accessModel?.isAllowed = true
        accessView?.showNewTitles(true)
    }
    
    
}
