//
//  ViewController.swift
//  BuildWeekDevLibs
//
//  Created by Alex Shillingford on 8/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
      styleSheet()
    }
    func styleSheet() {
        startButton.layer.cornerRadius = 15
        startButton.layer.shadowColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        startButton.layer.shadowOffset = CGSize(width: startButton.layer.borderWidth, height: 9)
        startButton.layer.masksToBounds = false
        startButton.layer.shadowOpacity = 6
        
    }
}


