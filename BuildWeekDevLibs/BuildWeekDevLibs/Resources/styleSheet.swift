//
//  styleSheet.swift
//  BuildWeekDevLibs
//
//  Created by brian vilchez on 8/28/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import  UIKit
extension UIButton {
    func styleSheet() {
        self.layer.cornerRadius = 15
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowOffset = CGSize(width: self.layer.borderWidth, height: 10)
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 70
        self.layer.shadowRadius = 8
        
    }
}
