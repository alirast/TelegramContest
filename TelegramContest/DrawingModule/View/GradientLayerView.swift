//
//  GradientLayerView.swift
//  TelegramContest
//
//  Created by N S on 25.04.2023.
//

import UIKit

class GradientLayerView: UIView {
    override static var layerClass: AnyClass {
        //instead of standard layer
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.frame = bounds //our custom view should be then in view did appear
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.5]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
