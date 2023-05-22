//
//  ShapeBubbleView.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

class ShapeBubbleView: UIView {
    lazy var bubbleView: UIImageView = {
        let bubble = UIImageView()
        bubble.translatesAutoresizingMaskIntoConstraints = false
        bubble.image = UIImage(named: "shapeBubble")
        bubble.tintColor = .white
        return bubble
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bubbleView)
        
        setupBubbleView()
    }
    
    private func setupBubbleView() {
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor),
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
