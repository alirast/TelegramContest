//
//  ToolView.swift
//  TelegramContest
//
//  Created by N S on 12.04.2023.
//

import UIKit

enum ToolType {
    case pen
    case pencil
    case brush
    case neon
    case eraser
}

class ToolView {
    let tip: String?
    let body: String?
    let color: UIColor
    
    init(tip: String, body: String, color: UIColor) {
        self.tip = tip
        self.body = body
        self.color = color
    }

}


