//
//  AccessModuleProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import Foundation

//protocol for view
//if button pressed once - title changes forever
protocol AccessViewProtocol: AnyObject {
    func showNewTitles()
}

//protocol for presenter itself
protocol AccessPresenterProtocol: AnyObject {
    init(accessView: AccessViewProtocol, router: RouterProtocol)
    func setAccessTitles()
}
