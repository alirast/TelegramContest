//
//  LeftMainEditorView.swift
//  TelegramContest
//
//  Created by N S on 21.05.2023.
//

import UIKit

class LeftMainEditorView: UIView {
    lazy var colorWheel: UIColorWell = {
        let colorWheel = UIColorWell()
        colorWheel.translatesAutoresizingMaskIntoConstraints = false
        colorWheel.title = "Colors"
        return colorWheel
    }()
    
    lazy var cancelAndBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.tintColor = .white //always
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(colorWheel)
        addSubview(cancelAndBackButton)
        
        NSLayoutConstraint.activate([
            cancelAndBackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelAndBackButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cancelAndBackButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12),
            cancelAndBackButton.heightAnchor.constraint(equalTo: cancelAndBackButton.widthAnchor),
            
            colorWheel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            colorWheel.bottomAnchor.constraint(equalTo: cancelAndBackButton.topAnchor, constant: -5),
            colorWheel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12),
            colorWheel.heightAnchor.constraint(equalTo: colorWheel.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
