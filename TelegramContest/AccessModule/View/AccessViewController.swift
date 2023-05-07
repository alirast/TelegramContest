//
//  ViewController.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit

final class AccessViewController: UIViewController, AccessViewDelegate, AccessViewProtocol {
    //link to view with layout
    private var accessView = AccessView()
    //link to presenter
    var presenter: AccessPresenterProtocol!

    override func loadView() {
        //changing system view to our custom access view
        view = accessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessView.delegate = self
        
        if let newButtonTitle = presenter.getSavedButtonTitle(), let newLabelTitle = presenter.getSavedLabelTitle() {
            accessView.accessButton.setTitle(newButtonTitle, for: .normal)
            accessView.accessLabel.text = newLabelTitle
        } else {
            accessView.accessButton.setTitle("Allow Access", for: .normal)
            accessView.accessLabel.text = "Access Your Photos"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        accessView.accessButton.shimmer()
    }
    
    //method from delegate (access view)
    //button tapped
    //from view controller to presenter
    func didAllowAccess() {
        presenter.saveNewTitles("Let's go", "Edit My Photos")
        accessView.accessButton.setTitle("Let's go", for: .normal)
        accessView.accessLabel.text = "Edit My Photos"
    }
}

