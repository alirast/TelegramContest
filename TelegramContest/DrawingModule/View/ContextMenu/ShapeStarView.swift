//
//  ShapeStarView.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

class ShapeStarView: UIView {
    lazy var starView: UIImageView = {
        let star = UIImageView()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.image = UIImage(named: "shapeStar")
        star.tintColor = .white
        return star
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(starView)
        
        setupStarView()
    }
    
    private func setupStarView() {
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(equalTo: topAnchor),
            starView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
