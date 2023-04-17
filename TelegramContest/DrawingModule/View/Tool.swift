//
//  Tool.swift
//  TelegramContest
//
//  Created by N S on 17.04.2023.
//

import UIKit

class Tool: UIView {
//TODO: - set up colors
    lazy var containerView = UIView()
    
    lazy var toolBodyView = UIImageView()
    lazy var toolBodyName = String()
    
    lazy var toolTipView = UIImageView()
    lazy var toolTipName = String()
    
    lazy var toolWidthView = UIView()
    lazy var toolColor = UIColor()
    lazy var toolWidth = Int()
    
    init(toolBodyName: String, toolTipName: String, toolColor: UIColor, toolWidth: Int) {
        super.init(frame: .zero)
        self.toolBodyName = toolBodyName
        self.toolTipName = toolTipName
        self.toolColor = toolColor
        self.toolWidth = toolWidth
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.toolBodyView.translatesAutoresizingMaskIntoConstraints = false
        self.toolTipView.translatesAutoresizingMaskIntoConstraints = false
        self.toolWidthView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(toolBodyView)
        containerView.addSubview(toolTipView)
        containerView.addSubview(toolWidthView)
        
        setupTool()
    }
    
    func setupTool() {
        toolBodyView = UIImageView(image: UIImage(named: toolBodyName))
        toolTipView = UIImageView(image: UIImage(named: toolTipName))
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: bounds.width),
            containerView.heightAnchor.constraint(equalToConstant: bounds.height),
            
            toolBodyView.topAnchor.constraint(equalTo: containerView.topAnchor),
            toolBodyView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            toolBodyView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            toolTipView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            toolTipView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            toolTipView.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            toolWidthView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            toolWidthView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            toolWidthView.topAnchor.constraint(equalTo: toolTipView.bottomAnchor, constant: 10),
            toolWidthView.widthAnchor.constraint(equalTo: toolBodyView.widthAnchor),
            toolWidthView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
