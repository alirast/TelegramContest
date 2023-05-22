//
//  ShapeEllipseView.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

class ShapeEllipseView: UIView {
    lazy var ellipseView: UIImageView = {
        let ellipse = UIImageView()
        ellipse.translatesAutoresizingMaskIntoConstraints = false
        ellipse.image = UIImage(named: "shapeEllispe")
        ellipse.tintColor = .white
        return ellipse
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(ellipseView)
        
        setupEllipseView()
    }
    
    private func setupEllipseView() {
        NSLayoutConstraint.activate([
            ellipseView.topAnchor.constraint(equalTo: topAnchor),
            ellipseView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ellipseView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ellipseView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
