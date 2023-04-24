//
//  MainEditorView.swift
//  TelegramContest
//
//  Created by N S on 23.04.2023.
//

import UIKit

class MainEditorView: UIView {
    lazy var drawOrTextSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Draw", "Text"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1.0)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
        segmentedControl.selectedSegmentTintColor = .gray
        return segmentedControl
    }()
  
    lazy var downloadButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .gray //initial setup
        return button
    }()
    
    //cancel all changes and back to the grid
    lazy var cancelAndBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.tintColor = .white //always
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(drawOrTextSegmentedControl)
        addSubview(downloadButton)
        addSubview(cancelAndBackButton)
        
        setupMainEditorElements()
    }
    
    func setupMainEditorElements() {
        NSLayoutConstraint.activate([
            drawOrTextSegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            drawOrTextSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            drawOrTextSegmentedControl.leadingAnchor.constraint(equalTo: cancelAndBackButton.trailingAnchor, constant: -10),
            drawOrTextSegmentedControl.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -10),
            
            cancelAndBackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelAndBackButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cancelAndBackButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            cancelAndBackButton.heightAnchor.constraint(equalTo: cancelAndBackButton.widthAnchor),
            
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            downloadButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            downloadButton.heightAnchor.constraint(equalTo: downloadButton.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
