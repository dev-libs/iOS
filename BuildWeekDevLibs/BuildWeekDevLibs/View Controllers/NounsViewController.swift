//
//  NounsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol  CreateNounDelegate {
    func createNouns(with words: [Word])
}

class NounsViewController: UIViewController {

    //MARK: - properties
    var wordController = WordController()
    var delegate: CreateNounDelegate?
    
    //MARK: - outlets

    @IBOutlet weak var firstNoun: UITextField!
    @IBOutlet weak var secondNoun: UITextField!
    @IBOutlet weak var thirdNoun: UITextField!
    @IBOutlet weak var fourthNoun: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        wordController.addNouns(nounWords())
      //  delegate?.createNouns(with:nounWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VerbShowSegue" {
           guard let verbVC = segue.destination as? VerbsViewController else {return}
            verbVC.wordController = wordController
        }
    }
}

extension NounsViewController {
    
    private func styleSheet() {
      addWordButton.layer.cornerRadius = 10
      
    }
    
    func nounWords() -> [Word] {
        var nounWords:[Word] = []
        if let firstNoun = firstNoun.text,!firstNoun.isEmpty {
            let nounWord = Word(word: firstNoun)
            nounWords.append(nounWord)
        }
        if let secondNoun = secondNoun.text, !secondNoun.isEmpty {
            let nounWord = Word(word: secondNoun)
            nounWords.append(nounWord)
        }
        if let thirdNoun = thirdNoun.text,!thirdNoun.isEmpty {
            let nounWord = Word(word: thirdNoun)
            nounWords.append(nounWord)
        }
        if let fourthNoun = fourthNoun.text, !fourthNoun.isEmpty {
            let nounWord = Word(word: fourthNoun)
            nounWords.append(nounWord)
        }
        return nounWords
    }
}
