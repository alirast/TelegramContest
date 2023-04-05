//
//  ViewController.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit

class AccessViewController: UIViewController, AccessViewDelegate, AccessViewProtocol {
    //link to view with layout
    var accessView = AccessView()
    //link to presenter
    var presenter: AccessPresenterProtocol!
    //lazy var presenter = AccessPresenter()

    override func loadView() {
        //changing system view to our custom access view
        view = accessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessView.delegate = self
    }
    
    //method from delegate (access view)
    //button tapped
    //from view controller to presenter
    func didAllowAccess() {
        presenter.setAccessTitles()
    }
    
    //from presenter to view controller
    func showNewTitles() {
        accessView.accessLabel.text = "Edit My Photos"
        accessView.accessButton.setTitle("Let's go", for: .normal)
        
    }
}

