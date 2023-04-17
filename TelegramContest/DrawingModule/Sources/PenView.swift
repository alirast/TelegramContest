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
    
    let containerToolView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let penBodyView: UIImageView = {
        let penBody = UIImageView(image: UIImage(named: "pen"))
        penBody.translatesAutoresizingMaskIntoConstraints = false
        return penBody
    }()
    
    let penTipView: UIImageView = {
        let penTip = UIImageView(image: UIImage(named: "penTip"))
        penTip.translatesAutoresizingMaskIntoConstraints = false
        return penTip
    }()
    
    let penWidthView: UIView = {
        let penWidth = UIView()
        penWidth.translatesAutoresizingMaskIntoConstraints = false
        penWidth.backgroundColor = .cyan
        return penWidth
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerToolView)
        containerToolView.addSubview(penBodyView)
        containerToolView.addSubview(penTipView)
        containerToolView.addSubview(penWidthView)
        
        setupToolViews()
    }
    
    func setupToolViews() {
        NSLayoutConstraint.activate([
            containerToolView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerToolView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerToolView.widthAnchor.constraint(equalToConstant: bounds.width),
            containerToolView.heightAnchor.constraint(equalToConstant: bounds.height),
            
            penBodyView.topAnchor.constraint(equalTo: containerToolView.topAnchor),
            penBodyView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            penBodyView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            
            penTipView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            penTipView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            penTipView.topAnchor.constraint(equalTo: containerToolView.topAnchor),
            
            penWidthView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            penWidthView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            penWidthView.topAnchor.constraint(equalTo: penTipView.bottomAnchor, constant: 10),
            penWidthView.widthAnchor.constraint(equalTo: penBodyView.widthAnchor),
            penWidthView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
