//
//  PenView.swift
//  TelegramContest
//
//  Created by N S on 10.04.2023.
//

import Foundation
import UIKit

protocol PenViewDelegate: AnyObject {
//TODO: - add functions for calling them from PenView on main view controller
//maybe without delegate because we will need to conform to them (6 delegate protocols?)
}

class PenView: UIView {
    weak var delegate: PenViewDelegate?
    
    var penContainerView = UIView()
    
    lazy var penBody: UIImageView = {
        var penBodyView = UIImageView(image: UIImage(named: "pen"))
        return penBodyView
    }()
    
    lazy var penTip: UIImageView = {
        var penTipView = UIImageView(image: UIImage(named: "penTip"))
        penTipView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(penIsTapped)))
        return penTipView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        penContainerView.addSubview(penBody)
        penContainerView.addSubview(penTip)
        addSubview(penContainerView)
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func penIsTapped() {
        
    }
}
