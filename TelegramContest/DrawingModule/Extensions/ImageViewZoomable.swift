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
}
