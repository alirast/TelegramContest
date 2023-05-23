//
//  UIViewTransformation.swift
//  TelegramContest
//
//  Created by N S on 23.05.2023.
//

import UIKit

extension UIView {
    func zoom() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(enableZoom(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func enableZoom(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: superview)
        center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
        sender.setTranslation(.zero, in: superview)
    }
}
