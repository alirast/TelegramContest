//
//  ToolEditorView.swift
//  TelegramContest
//
//  Created by N S on 25.04.2023.
//

import UIKit

//add to vc when choose a tool
class ToolEditorView: UIView {
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white //always
        return button
    }()
    
    //add image and title - mb view not button
    lazy var toolTipButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Round", for: .normal)
        button.titleLabel?.textAlignment = .left //?
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        
        setupToolEditorElements()
    }
    
    private func setupToolEditorElements() {
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
