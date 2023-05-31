//
//  ContextMenuView.swift
//  TelegramContest
//
//  Created by N S on 07.04.2023.
//

import UIKit

enum Shape: String {
    case shapeRectangle
    case shapeEllipse
    case shapeBubble
    case shapeStar
    case shapeArrow
}

class ContextMenuView: UIView {
    weak var delegate: ContextMenuViewDelegate?
    
    lazy var shapeRectangle: UIAction = {
        var rectangle = UIAction(title: "Rectangle", image: UIImage(named: Shape.shapeRectangle.rawValue)) { action in
            self.createShape(Shape.shapeRectangle.rawValue)
        }
        
        return rectangle
    }()
    
    lazy var shapeEllipse: UIAction = {
        var ellipse = UIAction(title: "Ellipse", image: UIImage(named: Shape.shapeEllipse.rawValue)) { action in
            self.createShape(Shape.shapeEllipse.rawValue)
        }
        return ellipse
    }()
    
    lazy var shapeBubble: UIAction = {
        var bubble = UIAction(title: "Bubble", image: UIImage(named: Shape.shapeBubble.rawValue)) { action in
            self.createShape(Shape.shapeBubble.rawValue)
        }
        return bubble
    }()
    
    lazy var shapeStar: UIAction = {
        var star = UIAction(title: "Star", image: UIImage(named: Shape.shapeStar.rawValue)) { action in
            self.createShape(Shape.shapeStar.rawValue)
        }
        return star
    }()
    
    lazy var shapeArrow: UIAction = {
        var arrow = UIAction(title: "Arrow", image: UIImage(named: Shape.shapeArrow.rawValue)) { action in
            self.createShape(Shape.shapeArrow.rawValue)
        }
        return arrow
    }()
    
    lazy var menu: UIMenu = {
        let menu = UIMenu(title: "Shapes", options: .displayInline, children: [shapeRectangle, shapeEllipse, shapeBubble, shapeStar, shapeArrow])
        return menu
    }()
    
    func createShape(_ shape: Shape.RawValue) {
        let image = UIImageView(image: UIImage(named: shape))
        delegate?.addShapeToButton(image)
    }
}
