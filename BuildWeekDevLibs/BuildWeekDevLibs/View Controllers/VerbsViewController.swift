//
//  VerbsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit


class VerbsViewController: UIViewController {
    
    //MARK: - properties
    var delegate: CreateStoryDelegate?
    var wordController: WordController?
    //MARK: - outlets

    @IBOutlet weak var firstVerb: UITextField!
    @IBOutlet weak var secondVerb: UITextField!
    @IBOutlet weak var thirdVerb: UITextField!
    @IBOutlet weak var fourthVerb: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    @IBAction func arrowBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addWords(_ sender: UIButton) {
            addwords(with: verbWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }
 
}

extension VerbsViewController {
    
    private func styleSheet() {
        addWordButton.layer.cornerRadius = 15
        addWordButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
        addWordButton.layer.shadowOpacity = 6
    }
    
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
extension VerbsViewController: CreateStoryDelegate {
    
<<<<<<< Updated upstream
    func addwords(with words: [Word]) {
        let wordController = WordController()
        wordController.addVerbs(words)
        print(wordController.no)
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        addWordButton.styleSheet()
        firstVerb.becomeFirstResponder()
        firstVerb.delegate = self
        secondVerb.delegate = self
        thirdVerb.delegate = self
        fourthVerb.delegate = self
>>>>>>> Stashed changes
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdjectiveShowSegue" {
            guard let adjectiveVC = segue.destination as? AdjectivesViewController else {return}
            adjectiveVC.delegate = self
        }
    }
    
}
extension VerbsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstVerb {
            textField.resignFirstResponder()
            secondVerb.becomeFirstResponder()
            return true
        } else if textField == secondVerb {
            textField.resignFirstResponder()
            thirdVerb.becomeFirstResponder()
            return true
        } else if textField == thirdVerb {
            textField.resignFirstResponder()
            fourthVerb.becomeFirstResponder()
            return true
        } else if textField == fourthVerb {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
}
