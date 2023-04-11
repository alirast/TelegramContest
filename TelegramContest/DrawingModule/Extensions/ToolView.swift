//
//  ToolView.swift
//  TelegramContest
//
//  Created by N S on 11.04.2023.
//

import UIKit

//TODO: - complete after transition to the 3rdVC

extension UIView {
    static func customTool(tip: String, body: String, color: UIColor) -> UIView {
        let containerToolView: UIView = {
            let toolView = UIView()
            toolView.translatesAutoresizingMaskIntoConstraints = false
            return toolView
        }()
        
        let toolBodyView: UIImageView = {
            let toolBody = UIImageView(image: UIImage(named: body))
            toolBody.translatesAutoresizingMaskIntoConstraints = false
            return toolBody
        }()
        
        let toolTipView: UIImageView = {
            let toolTip = UIImageView(image: UIImage(named: tip))
            toolTip.backgroundColor = color
            toolTip.translatesAutoresizingMaskIntoConstraints = false
            return toolTip
        }()
        
        let toolWidthView: UIView = {
            let toolWidth = UIView()
            toolWidth.translatesAutoresizingMaskIntoConstraints = false
            toolWidth.backgroundColor = color
            return toolWidth
        }()
        
        containerToolView.addSubview(toolBodyView)
        containerToolView.addSubview(toolTipView)
        containerToolView.addSubview(toolWidthView)
        
        NSLayoutConstraint.activate([
            toolBodyView.topAnchor.constraint(equalTo: containerToolView.topAnchor),
            toolBodyView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            toolBodyView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            
            toolTipView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            toolTipView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            toolTipView.topAnchor.constraint(equalTo: containerToolView.topAnchor),
            
            toolWidthView.centerXAnchor.constraint(equalTo: containerToolView.centerXAnchor),
            toolWidthView.centerYAnchor.constraint(equalTo: containerToolView.centerYAnchor),
            toolWidthView.topAnchor.constraint(equalTo: toolTipView.bottomAnchor, constant: 10),
            toolWidthView.widthAnchor.constraint(equalTo: toolBodyView.widthAnchor),
            toolWidthView.heightAnchor.constraint(equalToConstant: 10)
        ])
        return containerToolView
    }
}
