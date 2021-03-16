//
//  Utils.swift
//  ImageClassificator
//
//  Created by Chantal Deguire on 2021-03-16.
//

import Foundation
import UIKit

extension UIImage {
    static let placeholder = UIImage(named: "placeholder.png")
}

extension UIButton {
    func enable() {
        self.isEnabled = true
        self.backgroundColor = UIColor.systemBlue
    }
    
    func disable() {
        self.isEnabled = false
        self.backgroundColor = UIColor.lightGray
    }
}

extension UIBarButtonItem {
    func enable() { self.isEnabled = true }
    func disable() { self.isEnabled = false }
}
