//
//  ImageViewZoomable.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

extension UIImageView {
    func zoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(enableZooming(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(pinchGesture)
    }
    
    @objc private func enableZooming(_ sender: UIPinchGestureRecognizer) {
        print("start zooming")
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
    
    func changePosition() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(enableMoving(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func enableMoving(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: superview)
        center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
        sender.setTranslation(.zero, in: superview)
    }
    
    func rotate() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(enableRotation(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(rotationGesture)
    }
    
    @objc private func enableRotation(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .changed {
            transform = transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
