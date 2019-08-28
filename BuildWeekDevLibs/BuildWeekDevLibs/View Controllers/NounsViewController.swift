//
//  NounsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class NounsViewController: UIViewController {

    //MARK: - properties
    
    var wordController = WordController()
    
    //MARK: - outlets

    @IBOutlet weak var firstNoun: UITextField!
    @IBOutlet weak var secondNoun: UITextField!
    @IBOutlet weak var thirdNoun: UITextField!
    @IBOutlet weak var fourthNoun: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var nouns: [Word] = []
        if let firstNoun = firstNoun.text,!firstNoun.isEmpty {
            let noun = Word(word: firstNoun)
            nouns.append(noun)
        }
        if let secondNoun = secondNoun.text, !secondNoun.isEmpty {
            let noun = Word(word: secondNoun)
            nouns.append(noun)
        }
        if let thirdNoun = thirdNoun.text,!thirdNoun.isEmpty {
            let noun = Word(word: thirdNoun)
            nouns.append(noun)
        }
        if let fourthNoun = fourthNoun.text, !fourthNoun.isEmpty {
            let noun = Word(word: fourthNoun)
            nouns.append(noun)
        }
        wordController.addNouns(nouns)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowVerbsSegue" {
            guard let verbsVC = segue.destination as? VerbsViewController else { return }
            verbsVC.wordController = wordController
        }
    }
}
