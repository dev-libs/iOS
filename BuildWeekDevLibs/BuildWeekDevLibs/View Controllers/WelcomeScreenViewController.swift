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
        configureUI()
    }
    
    /// style sheet for button.
    func configureUI() {
        startButton.layer.cornerRadius = 15
        startButton.layer.shadowOffset = CGSize(width: startButton.layer.borderWidth, height: 20)
        startButton.layer.masksToBounds = false
        
        // navigation setup
        navigationController?.isNavigationBarHidden = true
    }
    

    
}


