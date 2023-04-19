//
//  ShimmerButton.swift
//  TelegramContest
//
//  Created by N S on 18.04.2023.
//

import UIKit

extension UIButton {
    func shimmer() {
        let currentShotButton = self.shot?.withRenderingMode(.alwaysTemplate)
        let imageShotButton = UIImageView(image: currentShotButton)
        //white blink for button effect
        imageShotButton.tintColor = UIColor(white: 0.9, alpha: 1.0)
        
        guard let mainImage = imageShotButton.shot else { return }
        let imageButtonWidth = mainImage.size.width
        let imageButtonHeight = mainImage.size.height
        
        //main layer - holds effect - with image of shot
        let mainShineLayer = CALayer()
        mainShineLayer.contents = mainImage.cgImage
        mainShineLayer.frame = bounds
        
        let gradientLayer = CAGradientLayer()
        //2 clears to make the effect short
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.35, 0.50, 0.65, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.frame = CGRect(x: -imageButtonWidth, y: 0, width: imageButtonWidth, height: imageButtonHeight)
        
        //animation for gradientLayer
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.byValue = imageButtonWidth * 2
        animation.duration = 3
        //infinite loop
        animation.repeatCount = Float.greatestFiniteMagnitude
        //begin slowly, accelerate, end slowly
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        //adding shine layer as sublayer for button
        layer.addSublayer(mainShineLayer)
        mainShineLayer.mask = gradientLayer
        gradientLayer.add(animation, forKey: "shimmer")
        
    }
}
extension UIView {
    var shot: UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        //context - where to render
        //layer - from UIView
        let image = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return image
    }
}


