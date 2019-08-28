//
//  ViewController.swift
//  BuildWeekDevLibs
//
//  Created by Alex Shillingford on 8/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      startButton.layer.cornerRadius = 10
        startButton.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        startButton.layer.shadowOffset = CGSize(width: startButton.layer.borderWidth, height: 2)
        startButton.layer.masksToBounds = false
        startButton.layer.shadowOpacity = 1
    }


}

