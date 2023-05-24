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
            let thin = UIAction(image: UIImage(named: Width.thin.rawValue)) { [self] action in
                print("thin chosen")
                toolWidth = 5.0
                setupWidth(toolWidth)
                print("configuration \(toolWidth)")
            }
            
            let medium = UIAction(image: UIImage(named: Width.medium.rawValue)) { [self] action in
                print("medium chosen")
                toolWidth = 30.0
                setupWidth(toolWidth)
                print("configuration \(toolWidth)")
            }
            
            let bold = UIAction(image: UIImage(named: Width.bold.rawValue)) { [self] action in
                print("bold chosen")
                toolWidth = 200.0
                setupWidth(self.toolWidth)
                print("configuration \(toolWidth)")
            }
            
            if #available(iOS 16.0, *) {
                return UIMenu(options: .displayInline, preferredElementSize: .medium, children: [thin, medium, bold])
            } else {
                return UIMenu(options: .displayInline, children: [thin, medium, bold])
            }
        })

        return configuration
    }
}
