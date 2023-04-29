//
//  ToolEditorView.swift
//  TelegramContest
//
//  Created by N S on 25.04.2023.
//

import UIKit

//add to vc when choose a tool - should be our custom slider + constraints
class ToolEditorView: UIView {
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white //always
        return button
    }()
    
    lazy var toolWidthSlider: WeightSlider = {
        let slider = WeightSlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .darkGray
        slider.minimumValue = 0
        slider.maximumValue = 10
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        addSubview(toolWidthSlider)
        
        setupToolEditorElements()
    }
    
    private func setupToolEditorElements() {
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            
            toolWidthSlider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            toolWidthSlider.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 15),
            toolWidthSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
