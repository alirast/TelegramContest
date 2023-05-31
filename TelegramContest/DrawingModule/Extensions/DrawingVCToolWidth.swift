//
//  DrawingVCToolWidth.swift
//  TelegramContest
//
//  Created by N S on 23.05.2023.
//

import UIKit

enum Width: String {
    case thin, medium, bold
}

extension DrawingViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
            let thin = UIAction(title: "Thin", image: UIImage(named: Width.thin.rawValue)) { [self] action in
                toolWidth = 5.0
                setupWidth(toolWidth)
                print("configuration \(toolWidth)")
            }
            
            let medium = UIAction(title: "Medium", image: UIImage(named: Width.medium.rawValue)) { [self] action in
                toolWidth = 30.0
                setupWidth(toolWidth)
                print("configuration \(toolWidth)")
            }
            
            let bold = UIAction(title: "Bold", image: UIImage(named: Width.bold.rawValue)) { [self] action in
                toolWidth = 200.0
                setupWidth(self.toolWidth)
                print("configuration \(toolWidth)")
            }
            
            if #available(iOS 16.0, *) {
                return UIMenu(options: .displayInline, preferredElementSize: .medium, children: [thin, medium, bold])
            } else {
                return UIMenu(title: "Width", children: [thin, medium, bold])
            }
        })

        return configuration
    }
}
