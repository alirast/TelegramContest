//
//  AccessView.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit
import Lottie


protocol AccessViewDelegate: AnyObject {
    
}


class AccessView: UIView {
    weak var delegate: AccessViewDelegate?
    lazy var duckView: LottieAnimationView = {
        var view = LottieAnimationView()
        view = .init(name: "duck")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.contentMode = .scaleAspectFit
        
        view.loopMode = .loop
        view.animationSpeed = 1.0
        return view
    }()
    
    lazy var accessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Allow Access", for: .normal)
        return button
    }()
    
    lazy var accessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        addSubview(accessLabel)
        addSubview(accessButton)
        addSubview(duckView)
        
        
        NSLayoutConstraint.activate([
            accessLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            accessLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
