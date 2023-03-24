//
//  ViewController.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit

class AccessViewController: UIViewController, AccessViewDelegate {
    
    var accessView = AccessView()
    
    
    override func loadView() {
        view = accessView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessView.delegate = self
    }


}

