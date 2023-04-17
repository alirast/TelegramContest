//
//  AccessView.swift
//  TelegramContest
//
//  Created by N S on 24.03.2023.
//

import UIKit
import Lottie

protocol AccessViewDelegate: AnyObject {
    func didAllowAccess()
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
        view.play()
        return view
    }()
//FIXME: - shimmer animation for button
    lazy var accessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.2039, green: 0.4706, blue: 0.9647, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didPressAccessButton), for: .touchUpInside)
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
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //initial state of titles
        accessLabel.text = "Access Your Photos"
        accessButton.setTitle("Allow Access", for: .normal)
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
            accessButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            accessButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPressAccessButton() {
//FIXME: - save settings for titles if access allowed
        //from view to view controller
        delegate?.didAllowAccess()
    }
    
}
