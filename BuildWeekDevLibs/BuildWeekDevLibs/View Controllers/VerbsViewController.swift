//
//  VerbsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/28/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class VerbsViewController: UIViewController {
    
    //MARK: - properties
    
    var wordController: WordController?
    
    //MARK: - outlets

    @IBOutlet weak var firstVerb: UITextField!
    @IBOutlet weak var secondVerb: UITextField!
    @IBOutlet weak var thirdVerb: UITextField!
    @IBOutlet weak var fourthVerb: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var verbs: [Word] = []
        if let firstVerb = firstVerb.text,!firstVerb.isEmpty {
            let verbWord = Word(word: firstVerb)
            verbs.append(verbWord)
        }
        if let secondVerb = secondVerb.text, !secondVerb.isEmpty {
            let verbWord = Word(word: secondVerb)
            verbs.append(verbWord)
        }
        if let thirdVerb = thirdVerb.text,!thirdVerb.isEmpty {
            let verbWord = Word(word: thirdVerb)
            verbs.append(verbWord)
        }
        if let fourthVerb = fourthVerb.text,!fourthVerb.isEmpty {
            let verbWord = Word(word: fourthVerb)
            verbs.append(verbWord)
        }
        guard let wordController = wordController else { return }
        wordController.addVerbs(verbs)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAdjectivesSegue" {
            guard let adjectivesVC = segue.destination as? AdjectivesViewController else { return }
            guard let wordController = wordController else { return }
            adjectivesVC.wordController = wordController
        }
    }
}
