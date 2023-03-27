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
//FIXME: - remove delegate? because we have protocol for presenter, how sent to VC?
    //access view has
    weak var delegate: AccessViewDelegate?
    lazy var duckView: LottieAnimationView = {
        var view = LottieAnimationView()
        view = .init(name: "duck")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.animationSpeed = 1.0
        view.play()
        return view
    }()
    
    lazy var accessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//FIXME: - title should be set up in special method
        button.setTitle("Allow Access", for: .normal)
        return button
    }()
    
    lazy var accessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.sizeToFit()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
//FIXME: - title should be set up in special method
        label.text = "Access Your Photos and Videos"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        addSubview(accessLabel)
        addSubview(accessButton)
        addSubview(duckView)
        
        
        NSLayoutConstraint.activate([
//FIXME: - should not be equal to number
            duckView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            duckView.centerXAnchor.constraint(equalTo: centerXAnchor),
            duckView.widthAnchor.constraint(equalToConstant: 150),
            duckView.heightAnchor.constraint(equalToConstant: 150),
            
            accessLabel.topAnchor.constraint(equalTo: duckView.bottomAnchor, constant: 20),
            accessLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            accessLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            accessButton.topAnchor.constraint(equalTo: accessLabel.bottomAnchor, constant: 20),
            accessButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            accessButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
