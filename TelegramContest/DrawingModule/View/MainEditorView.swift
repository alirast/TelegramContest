//
//  MainEditorView.swift
//  TelegramContest
//
//  Created by N S on 23.04.2023.
//

import UIKit

class MainEditorView: UIView, ContextMenuViewDelegate {
    
    var contextMenu = ContextMenuView()
    
    var currentSegment = DrawOrText.draw
    
    lazy var drawOrTextSegmentedControl: RoundSegmentedControl = {
        let segmentedControl = RoundSegmentedControl(items: ["Draw", "Text"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1.0)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
        segmentedControl.selectedSegmentTintColor = .gray
        
        segmentedControl.addTarget(self, action: #selector(switchDrawText), for: .valueChanged)
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
    
    lazy var colorWheel: UIColorWell = {
        let colorWheel = UIColorWell()
        colorWheel.translatesAutoresizingMaskIntoConstraints = false
        colorWheel.title = "Colors"
        return colorWheel
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.menu = contextMenu.menu
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(drawOrTextSegmentedControl)
        addSubview(downloadButton)
        addSubview(cancelAndBackButton)
        addSubview(colorWheel)
        addSubview(addButton)
        
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
            downloadButton.heightAnchor.constraint(equalTo: downloadButton.widthAnchor),
            
            colorWheel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            colorWheel.bottomAnchor.constraint(equalTo: cancelAndBackButton.topAnchor, constant: -15),
            colorWheel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            colorWheel.heightAnchor.constraint(equalTo: colorWheel.widthAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: downloadButton.topAnchor, constant: -15),
            addButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
        ])
    }
//FIXME: - segment
    @objc func switchDrawText(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("drawing segment")
            currentSegment = .draw
            print(currentSegment)
        case 1:
            print("text segment")
            currentSegment = .text
            print(currentSegment)
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
