//
//  TextFieldInset.swift
//  BuildWeekDevLibs
//
//  Created by brian vilchez on 8/29/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}



