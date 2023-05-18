//
//  TextView.swift
//  TelegramContest
//
//  Created by N S on 08.05.2023.
//

import UIKit

class TextView: UIView {
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.frame = bounds
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.keyboardType = .default
        textView.keyboardAppearance = .dark
        textView.spellCheckingType = .no
        textView.autocorrectionType = .no
        textView.returnKeyType = .default
        textView.isUserInteractionEnabled = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textView)
        addPanGesture()
        setupNotificationCenter()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.frame.size.height = textView.contentSize.height
    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: superview)
        center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
        gesture.setTranslation(.zero, in: superview)
    }
    
    func setText(_ text: String) {
        textView.text = text
        textView.textColor = UIColor.lightGray
        textView.frame.size.height = textView.contentSize.height
    }
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc private func updateTextView(_ notification: Notification) {
        let userInfo = notification.userInfo
        //coordinates of the keyboard
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Wanna write something?"
            textView.textColor = .lightGray
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
}
