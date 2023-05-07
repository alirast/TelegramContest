//
//  AccessModuleProtocols.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import Foundation

//protocol for view
protocol AccessViewProtocol: AnyObject {
    
}

//protocol for presenter itself
protocol AccessPresenterProtocol: AnyObject {
    init(accessView: AccessViewProtocol, router: RouterProtocol)
    
    func saveNewTitles(_ newButtonTitle: String, _ newLabelTitle: String)
    func getSavedButtonTitle() -> String?
    func getSavedLabelTitle() -> String?
}
