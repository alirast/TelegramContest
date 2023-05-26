//
//  RightMainEditorView.swift
//  TelegramContest
//
//  Created by N S on 21.05.2023.
//

import UIKit

class RightMainEditorView: UIView, ContextMenuViewDelegate {
    
    weak var delegate: MainEditorDelegate?
    
    weak var presentationDelegate: PresentationViewDelegate?
    
    var contextMenu = ContextMenuView()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.menu = contextMenu.menu
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .gray //initial setup
        button.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(addButton)
        addSubview(downloadButton)
        
        contextMenu.delegate = self
        
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: downloadButton.topAnchor, constant: -5),
            addButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor),
            
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            downloadButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            downloadButton.heightAnchor.constraint(equalTo: downloadButton.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveImage() {
        print("saving image")
        delegate?.saveImageToPhotos()
    }
    
    func addShapeToButton(_ image: UIImageView) {
        print("add shape to button")
        print(image.image == nil)
        presentationDelegate?.addImageToViewController(image)
    }
}
