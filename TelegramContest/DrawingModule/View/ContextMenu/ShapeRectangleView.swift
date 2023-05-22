//
//  ShapeRectangleView.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

class ShapeRectangleView: UIView {
    lazy var rectangleView: UIImageView = {
        let rectangle = UIImageView()
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.image = UIImage(named: "shapeRectangle")
        rectangle.tintColor = .white
        return rectangle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rectangleView)
        
        setupRectangleView()
    }
    
    private func setupRectangleView() {
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
