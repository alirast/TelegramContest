//
//  TextView.swift
//  TelegramContest
//
//  Created by N S on 08.05.2023.
//

import UIKit

class TextView: UIView {
    lazy var textViewContainer: UIView = {
        let container = UIView()
        container.frame = frame //the size of container?
        container.backgroundColor = .clear
        container.isUserInteractionEnabled = true
        return container
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.tintColor = .white
        textView.keyboardType = .default
        textView.keyboardAppearance = .dark
        textView.spellCheckingType = .no
        textView.autocorrectionType = .no
        textView.returnKeyType = .done
        textView.text = "" //textViewPlaceString
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.isUserInteractionEnabled = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        textViewContainer.addSubview(textView)
        addSubview(textViewContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
