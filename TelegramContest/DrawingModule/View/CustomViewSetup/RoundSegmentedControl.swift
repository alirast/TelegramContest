//
//  RoundSegmentedControl.swift
//  TelegramContest
//
//  Created by N S on 23.04.2023.
//

import UIKit

class RoundSegmentedControl: UISegmentedControl {
    private lazy var radius: CGFloat = bounds.height / 1.5
    
    override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.radius
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
