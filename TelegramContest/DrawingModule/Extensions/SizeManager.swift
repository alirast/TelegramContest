//
//  CanvasViewSizeManager.swift
//  TelegramContest
//
//  Created by N S on 16.05.2023.
//

import UIKit

class SizeManager {
    static func setSize(_ image: UIImage, toFitIn imageLayer: UIImageView) -> CGRect {
        let containerRatio = imageLayer.frame.size.height / imageLayer.frame.size.width
        let imageRatio = image.size.height / image.size.width
        return containerRatio > imageRatio ? getHeight(for: image, in: imageLayer) : getWidth(for: image, in: imageLayer)
    }
    
    private static func getHeight(for image: UIImage, in imageLayer: UIImageView) -> CGRect {
        let ratio = imageLayer.frame.size.width / image.size.width
        let newHeight = ratio * image.size.height
        let size = CGSize(width: imageLayer.frame.width, height: newHeight)
        var yPosition = (imageLayer.frame.size.height - newHeight) / 2
        yPosition = (yPosition < 0 ? 0 : yPosition) + imageLayer.frame.origin.y
        let origin = CGPoint.init(x: 0, y: yPosition)
        return CGRect.init(origin: origin, size: size)
    }
    
    private static func getWidth(for image: UIImage, in imageLayer: UIImageView) -> CGRect {
        let ratio = imageLayer.frame.size.height / image.size.height
        let newWidth = ratio * image.size.width
        let size = CGSize(width: newWidth, height: imageLayer.frame.height)
        let xPosition = ((imageLayer.frame.size.width - newWidth) / 2) + imageLayer.frame.origin.x
        let yPosition = imageLayer.frame.origin.y
        let origin = CGPoint.init(x: xPosition, y: yPosition)
        return CGRect.init(origin: origin, size: size)
    }
}
