//
//  ViewController.swift
//  BuildWeekDevLibs
//
//  Created by Alex Shillingford on 8/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      styleSheet()
        navigationController?.isNavigationBarHidden = true
    }
    
    /// style sheet for button.
    func styleSheet() {
        
        startButton.layer.cornerRadius = 15
        startButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        startButton.layer.shadowOffset = CGSize(width: startButton.layer.borderWidth, height: 9)
        startButton.layer.masksToBounds = false
        startButton.layer.shadowOpacity = 6
       
    }
    

}


