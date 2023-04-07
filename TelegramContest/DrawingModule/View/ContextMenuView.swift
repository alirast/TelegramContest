//
//  ContextMenuView.swift
//  TelegramContest
//
//  Created by N S on 07.04.2023.
//

import Foundation
import UIKit

protocol ContextMenuViewDelegate: AnyObject {
    
}

class ContextMenuView: UIView {
    weak var delegate: ContextMenuViewDelegate?
    
    lazy var shapeRectangle: UIAction = {
        var rectangle = UIAction(title: "Rectangle", image: UIImage(named: "shapeRectangle")) { action in
            //
        }
        
        return rectangle
    }()
    
    lazy var shapeEllipse: UIAction = {
        var ellipse = UIAction(title: "Ellipse", image: UIImage(named: "shapeEllipse")) { action in
            //
        }
        return ellipse
    }()
    
    lazy var shapeBubble: UIAction = {
        var bubble = UIAction(title: "Bubble", image: UIImage(named: "shapeBubble")) { action in
            //
        }
        return bubble
    }()
    
    lazy var shapeStar: UIAction = {
        var star = UIAction(title: "Star", image: UIImage(named: "shapeStar")) { action in
            //
        }
        return star
    }()
    
    lazy var shapeArrow: UIAction = {
        var arrow = UIAction(title: "Arrow", image: UIImage(named: "shapeArrow")) {
            action in
            
        }
        return arrow
    }()
}
