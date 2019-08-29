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
    var wordcontroller = WordController()
    
    //MARK: - outlets

    @IBOutlet weak var firstNoun: UITextField!
    @IBOutlet weak var secondNoun: UITextField!
    @IBOutlet weak var thirdNoun: UITextField!
    @IBOutlet weak var fourthNoun: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        wordcontroller.addNouns(nounWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }
    
}

extension NounsViewController {
    
   private func styleSheet() {
        
        addWordButton.layer.cornerRadius = 15
        addWordButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
        addWordButton.layer.shadowOpacity = 6
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
<<<<<<< Updated upstream
}

extension NounsViewController: CreateStoryDelegate {
    func addwords(with words: [Word]) {
        let wordController = WordController()
        wordController.addNouns(words)
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWordButton.styleSheet()
        firstNoun.becomeFirstResponder()
        firstNoun.delegate = self
        secondNoun.delegate = self
        thirdNoun.delegate = self
        fourthNoun.delegate = self
        navigationController?.isNavigationBarHidden = true
>>>>>>> Stashed changes
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VerbShowSegue" {
            guard let verbVC = segue.destination as? VerbsViewController else {return}
            verbVC.delegate = self
            verbVC.wordController = wordcontroller
        }
    }
}
<<<<<<< Updated upstream

=======
extension NounsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNoun {
            textField.resignFirstResponder()
            secondNoun.becomeFirstResponder()
            return true
        } else if textField == secondNoun {
            textField.resignFirstResponder()
            thirdNoun.becomeFirstResponder()
            return true
        } else if textField == thirdNoun {
            textField.resignFirstResponder()
            fourthNoun.becomeFirstResponder()
            return true
        } else if textField == fourthNoun {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
}
>>>>>>> Stashed changes
