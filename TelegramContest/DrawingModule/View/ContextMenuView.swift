//
//  ContextMenuView.swift
//  TelegramContest
//
//  Created by N S on 07.04.2023.
//

import UIKit

class ContextMenuView: UIView {
    weak var delegate: ContextMenuViewDelegate?
    
    lazy var shapeRectangle: UIAction = {
        var rectangle = UIAction(title: "Rectangle", image: UIImage(named: "shapeRectangle")) { action in
            print("Rectangle chosen")
        }
        
        return rectangle
    }()
    
    lazy var shapeEllipse: UIAction = {
        var ellipse = UIAction(title: "Ellipse", image: UIImage(named: "shapeEllipse")) { action in
            print("Ellipse chosen")
        }
        return ellipse
    }()
    
    lazy var shapeBubble: UIAction = {
        var bubble = UIAction(title: "Bubble", image: UIImage(named: "shapeBubble")) { action in
            print("Bubble chosen")
        }
        return bubble
    }()
    
    lazy var shapeStar: UIAction = {
        var star = UIAction(title: "Star", image: UIImage(named: "shapeStar")) { action in
            print("Star chosen")
        }
        return star
    }()
    
    lazy var shapeArrow: UIAction = {
        var arrow = UIAction(title: "Arrow", image: UIImage(named: "shapeArrow")) {
            action in
            print("Arrow chosen")
        }
        return arrow
    }()
    
    lazy var menu: UIMenu = {
        let menu = UIMenu(title: "Shapes", options: .displayInline, children: [shapeRectangle, shapeEllipse, shapeBubble, shapeStar, shapeArrow])
        return menu
    }()
}
