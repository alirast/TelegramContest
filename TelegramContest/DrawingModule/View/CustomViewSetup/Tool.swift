//
//  Tool.swift
//  TelegramContest
//
//  Created by N S on 22.04.2023.
//

import UIKit

final class Tool: UIView {
    var toolBodyImage = UIImageView()
    var toolTipImage = UIImageView()
    
    init(toolBody: String, toolTip: String?) {
        super.init(frame: .zero)
        toolBodyImage.image = UIImage(named: toolBody)
        toolBodyImage.isUserInteractionEnabled = true
        toolTipImage.image = UIImage(named: toolTip ?? "")?.withRenderingMode(.alwaysTemplate)
        //toolTipImage.tintColor = editor.colorWheel.selectedColor
        addSubview(toolBodyImage)
        addSubview(toolTipImage)
        
        toolBodyImage.translatesAutoresizingMaskIntoConstraints = false
        toolTipImage.translatesAutoresizingMaskIntoConstraints = false
        
        setupTool()
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
