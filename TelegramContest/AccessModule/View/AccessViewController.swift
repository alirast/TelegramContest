//
//  ViewController.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit

class AccessViewController: UIViewController, AccessViewDelegate, AccessViewProtocol {
    //link to presenter
    var presenter: AccessViewPresenterProtocol!
    //link to view with layout
    var accessView = AccessView()

    override func loadView() {
        //changing system view to our custom access view
        view = accessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessView.delegate = self
    }
    
    //method from delegate (access view)
    func didAllowAccess() {
//FIXME: - what method should be from presenter?
//FIXME: - why nil?? the problem should be in assmebly layer and scene delegate
        presenter.setAccessTitles()
    }
    
    func showNewTitles(_ condition: Bool) {
        //condition = data from model
        if condition {
            accessView.accessLabel.text = "Edit"
            accessView.accessButton.setTitle("Edit", for: .normal)
        }
    }


}

