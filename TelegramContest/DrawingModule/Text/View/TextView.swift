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
        container.translatesAutoresizingMaskIntoConstraints = false
        container.frame = frame //the size of container?
        container.backgroundColor = .clear
        container.isUserInteractionEnabled = true
        return container
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //where is the content placed
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)
        
        textView.tintColor = .white
        textView.keyboardType = .default
        textView.keyboardAppearance = .dark
        textView.spellCheckingType = .no
        textView.autocorrectionType = .no
        textView.returnKeyType = .done
        textView.text = "" //textViewPlaceString
        textView.textAlignment = .center
        textView.backgroundColor = .gray //should be clear at the end
        textView.isUserInteractionEnabled = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(_ :)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        //textViewContainer.addSubview(textView)
        //addSubview(textViewContainer)
        addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    @objc private func updateTextView(_ notification: Notification) {
        let userInfo = notification.userInfo
        //all coordinations for keyboard
        let keyboardRectangle = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = convert(keyboardRectangle, to: window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
