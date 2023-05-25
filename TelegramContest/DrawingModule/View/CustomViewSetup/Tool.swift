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
        addSubview(toolBodyImage)
        addSubview(toolTipImage)
        
        toolBodyImage.translatesAutoresizingMaskIntoConstraints = false
        toolTipImage.translatesAutoresizingMaskIntoConstraints = false
        
        setupTool()
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateSelectedTool()
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
    
    private func animateSelectedTool() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 3, -5, 3, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        self.layer.add(animation, forKey: "shake")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
