//
//  VerbsViewController.swift
//  BuildWeekDevLibs
//
//  Created by brian vilchez on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol CreateVerbDelegate {
    func createVerbs(with word: [Word] )
    
}

class VerbsViewController: UIViewController {

    
    //MARK: - properties
    @IBOutlet weak var firstVerbLabel: UILabel!
    @IBOutlet weak var secondVerbLabel: UILabel!
    @IBOutlet weak var thirdVerbLabel: UILabel!
    @IBOutlet weak var fourthVerbLabel: UILabel!
    @IBOutlet weak var addWordButton: UIButton!
    var delegate: CreateVerbDelegate?
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        delegate?.createVerbs(with: verbWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }
    
}
extension VerbsViewController {
    
    private func styleSheet() {
        addWordButton.layer.masksToBounds = true
        addWordButton.layer.cornerRadius = 10
        addWordButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        addWordButton.layer.shadowRadius = 5
        addWordButton.layer.shadowOpacity = 0.5
    }
    
    private func verbWords() -> [Word] {
        var verbs: [Word] = []
        if let firstVerb = firstVerbLabel.text,!firstVerb.isEmpty {
            let verb = Word(word: firstVerb)
            verbs.append(verb)
        }
        if let secondVerb = secondVerbLabel.text, !secondVerb.isEmpty {
            let verb = Word(word: secondVerb)
            verbs.append(verb)
        }
        if let thirdVerb = thirdVerbLabel.text,!thirdVerb.isEmpty {
            let verb = Word(word: thirdVerb)
            verbs.append(verb)
        }
        if let fourthVerb = fourthVerbLabel.text,!fourthVerb.isEmpty {
            let verb = Word(word: fourthVerb)
            verbs.append(verb)
        }
        return verbs
    }
}
  


