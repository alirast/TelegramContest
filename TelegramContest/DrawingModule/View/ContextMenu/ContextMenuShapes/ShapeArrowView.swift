//
//  ShapeArrowView.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

class ShapeArrowView: UIView {
    lazy var arrowView: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(named: "shapeArrow")
        arrow.tintColor = .white
        return arrow
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(arrowView)
        
        setupArrowView()
    }
    
    private func setupArrowView() {
        NSLayoutConstraint.activate([
            arrowView.topAnchor.constraint(equalTo: topAnchor),
            arrowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            arrowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            arrowView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
