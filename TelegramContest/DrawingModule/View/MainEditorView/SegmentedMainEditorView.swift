//
//  MainEditorView.swift
//  TelegramContest
//
//  Created by N S on 23.04.2023.
//

import UIKit

protocol MainEditorDelegate: AnyObject {
    func chooseDrawOrText(_ sender: UISegmentedControl)
    func saveImageToPhotos()
}


class SegmentedMainEditorView: UIView, ContextMenuViewDelegate {
    
    weak var delegate: MainEditorDelegate?
    
    
    //var currentSegment: DrawOrText = .draw
    
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
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(drawOrTextSegmentedControl)
        
        setupMainEditorElements()
    }
    
    func setupMainEditorElements() {
        NSLayoutConstraint.activate([
            drawOrTextSegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            drawOrTextSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            drawOrTextSegmentedControl.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    @objc func switchDrawText(sender: UISegmentedControl) {
        delegate?.chooseDrawOrText(sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
