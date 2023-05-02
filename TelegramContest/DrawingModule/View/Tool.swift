//
//  Tool.swift
//  TelegramContest
//
//  Created by N S on 22.04.2023.
//

import UIKit

final class Tool: UIView {
    private let toolBodyImage = UIImageView()
    private let toolTipImage = UIImageView()
    
    init(toolBody: String, toolTip: String?) {
        super.init(frame: .zero)
        toolBodyImage.image = UIImage(named: toolBody)
        toolTipImage.image = UIImage(named: toolTip ?? "")
        
        addSubview(toolBodyImage)
        addSubview(toolTipImage)
        
        toolBodyImage.translatesAutoresizingMaskIntoConstraints = false
        toolTipImage.translatesAutoresizingMaskIntoConstraints = false
        
        setupTool()
    }
    
    private func setupTool() {
        toolBodyImage.contentMode = .scaleAspectFit
        toolTipImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            toolBodyImage.topAnchor.constraint(equalTo: topAnchor),
            toolBodyImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            toolBodyImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            toolTipImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            toolTipImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            toolTipImage.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
