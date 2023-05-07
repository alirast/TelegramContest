//
//  AccessPresenter.swift
//  TelegramContest
//
//  Created by N S on 27.03.2023.
//

import Foundation

final class AccessPresenter: AccessPresenterProtocol {
    weak var accessView: AccessViewProtocol?
    //not weak reference
    var router: RouterProtocol?
    required init(accessView: AccessViewProtocol, router: RouterProtocol) {
        self.accessView = accessView
        self.router = router
    }
    
    let defaults = UserDefaults.standard
    
    func saveNewTitles(_ newButtonTitle: String, _ newLabelTitle: String) {
        router?.showPhotoGrid()
        defaults.set(newButtonTitle, forKey: "newButtonTitle")
        defaults.set(newLabelTitle, forKey: "newLabelTitle")
        defaults.synchronize()
    }
    
    func getSavedButtonTitle() -> String? {
        return defaults.string(forKey: "newButtonTitle")
    }
    
    func getSavedLabelTitle() -> String? {
        return defaults.string(forKey: "newLabelTitle")
    }
}
