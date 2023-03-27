//
//  AccessPresenter.swift
//  TelegramContest
//
//  Created by N S on 27.03.2023.
//

import Foundation
//input protocol
protocol AccessViewPresenterProtocol: AnyObject {
//FIXME: - add router
    init(view: AccessViewProtocol)
    
    func setAccessButtonTitle()
    
    func setAccessLabelTitle()
}
//output protocol
protocol AccessViewProtocol: AnyObject {
    
}
class AccessPresenter {
    
}
