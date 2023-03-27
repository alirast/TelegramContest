//
//  AccessPresenter.swift
//  TelegramContest
//
//  Created by N S on 27.03.2023.
//

import Foundation

protocol AccessViewPresenterProtocol: AnyObject {
//FIXME: - add router
    init(view: AccessViewProtocol)
    
    func setAccessButtonTitle()
    
    func setAccessLabelTitle()
}

//if button pressed once - title changes forever
protocol AccessViewProtocol: AnyObject {
    func giveAccess()
}

class AccessPresenter: AccessViewPresenterProtocol {
    weak var accessView: AccessViewProtocol?
    
    required init(view: AccessViewProtocol) {
        self.accessView = view
    }
    
    func setAccessButtonTitle() {
        
    }
    
    func setAccessLabelTitle() {
        
    }
    
    
}
