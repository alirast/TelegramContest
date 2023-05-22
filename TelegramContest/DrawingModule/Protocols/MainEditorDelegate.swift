//
//  MainEditorDelegate.swift
//  TelegramContest
//
//  Created by N S on 22.05.2023.
//

import UIKit

protocol MainEditorDelegate: AnyObject {
    func chooseDrawOrText(_ sender: UISegmentedControl)
    func saveImageToPhotos()
}
