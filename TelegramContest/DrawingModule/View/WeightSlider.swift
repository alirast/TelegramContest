//
//  WeightSlider.swift
//  TelegramContest
//
//  Created by N S on 29.04.2023.
//

import UIKit

class WeightSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let newBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 15.0))
        super.trackRect(forBounds: newBounds)
        return newBounds
    }
}
