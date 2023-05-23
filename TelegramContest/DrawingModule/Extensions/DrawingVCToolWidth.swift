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
            let thin = UIAction(image: UIImage(named: Width.thin.rawValue)) { action in
                print("thin chosen")
            }
            
            let medium = UIAction(image: UIImage(named: Width.medium.rawValue)) { action in
                print("medium chosen")
        
            }
            
            let bold = UIAction(image: UIImage(named: Width.bold.rawValue)) { action in
                print("bold chosen")
            }
            if #available(iOS 16.0, *) {
                return UIMenu(options: .displayInline, preferredElementSize: .medium, children: [thin, medium, bold])
            } else {
                return UIMenu(children: [thin, medium, bold])
            }
        })
        return configuration
    }
}
