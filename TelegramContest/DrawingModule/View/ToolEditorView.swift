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
    
//FIXME: - should be changed when choose smth (switch-case?)
    var chosenTool = Tool(toolBody: "pencil", toolTip: "pencilTip")
    
    var bigWidthRound = UIImageView(image: UIImage(named: "round"))
    var smallWidthRound = UIImageView(image: UIImage(named: "round"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        addSubview(toolWidthSlider)
        
        addSubview(chosenTool)
        addSubview(bigWidthRound)
        addSubview(smallWidthRound)
        
        setupToolEditorElements()
    }
    
    private func setupToolEditorElements() {
        chosenTool.translatesAutoresizingMaskIntoConstraints = false
        bigWidthRound.translatesAutoresizingMaskIntoConstraints = false
        bigWidthRound.contentMode = .scaleAspectFit
        
        smallWidthRound.translatesAutoresizingMaskIntoConstraints = false
        smallWidthRound.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            
            toolWidthSlider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            toolWidthSlider.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 15),
            toolWidthSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            chosenTool.bottomAnchor.constraint(equalTo: toolWidthSlider.topAnchor, constant: -5),
            chosenTool.centerXAnchor.constraint(equalTo: toolWidthSlider.centerXAnchor),
            chosenTool.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            chosenTool.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            bigWidthRound.trailingAnchor.constraint(equalTo: toolWidthSlider.trailingAnchor),
            bigWidthRound.bottomAnchor.constraint(equalTo: toolWidthSlider.topAnchor, constant: -5),
            bigWidthRound.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            bigWidthRound.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            smallWidthRound.leadingAnchor.constraint(equalTo: toolWidthSlider.leadingAnchor),
            smallWidthRound.bottomAnchor.constraint(equalTo: toolWidthSlider.topAnchor, constant: -20),
            smallWidthRound.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),
            smallWidthRound.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
