//
//  VerbsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol CreateVerbDelegate {
    func createVerbs(with word: [Word] )
}

class VerbsViewController: UIViewController {
    
    //MARK: - properties
    
    var delegate: CreateVerbDelegate?

    //MARK: - outlets

    @IBOutlet weak var firstVerb: UITextField!
    @IBOutlet weak var secondVerb: UITextField!
    @IBOutlet weak var thirdVerb: UITextField!
    @IBOutlet weak var fourthVerb: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        delegate?.createVerbs(with: verbWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //styleSheet()
    }
}

extension VerbsViewController {
    
//    private func styleSheet() {
//        addWordButton.layer.masksToBounds = true
//        addWordButton.layer.cornerRadius = 10
//        addWordButton.layer.shadowOffset = CGSize(width: 3, height: 3)
//        addWordButton.layer.shadowRadius = 5
//        addWordButton.layer.shadowOpacity = 0.5
//    }
    
    private func verbWords() -> [Word] {
        var verbs: [Word] = []
        if let firstVerb = firstVerb.text,!firstVerb.isEmpty {
            let verb = Word(word: firstVerb)
            verbs.append(verb)
        }
        if let secondVerb = secondVerb.text, !secondVerb.isEmpty {
            let verb = Word(word: secondVerb)
            verbs.append(verb)
        }
        if let thirdVerb = thirdVerb.text,!thirdVerb.isEmpty {
            let verb = Word(word: thirdVerb)
            verbs.append(verb)
        }
        if let fourthVerb = fourthVerb.text,!fourthVerb.isEmpty {
            let verb = Word(word: fourthVerb)
            verbs.append(verb)
        }
        return verbs
    }
}
