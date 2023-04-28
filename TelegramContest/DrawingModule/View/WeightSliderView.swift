//
//  WeightSliderView.swift
//  TelegramContest
//
//  Created by N S on 28.04.2023.
//

import UIKit

class WeightSliderView: UIView {
    lazy var sliderImage: UIImageView = {
        let sliderImage = UIImageView()
        sliderImage.image = UIImage(named: "sliderBackHorizontal")
        sliderImage.contentMode = .scaleAspectFit
        sliderImage.translatesAutoresizingMaskIntoConstraints = false
        return sliderImage
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(sliderImage)
        addSubview(slider)
        
        setupSliderConstraints()
    }
    
    func setupSliderConstraints() {
        NSLayoutConstraint.activate([
            sliderImage.topAnchor.constraint(equalTo: topAnchor),
            sliderImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            sliderImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            sliderImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            slider.topAnchor.constraint(equalTo: topAnchor),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            slider.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
