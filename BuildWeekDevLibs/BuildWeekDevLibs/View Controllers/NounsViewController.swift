//
//  NounsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/28/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class NounsViewController: UIViewController {
    
    //MARK: - properties
    
    var wordController = WordController()
    
    //MARK: - outlets
    
    @IBOutlet weak var firstNounTextfield: UITextField!
    @IBOutlet weak var secondNounTextfield: UITextField!
    @IBOutlet weak var thirdNounTextfield: UITextField!
    @IBOutlet weak var fourthNounTextfield: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    @IBOutlet weak var borderVIew: UIView!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var nouns: [Word] = []
        
        if let firstNoun = firstNounTextfield.text,!firstNoun.isEmpty {
            let noun = Word(word: firstNoun)
            nouns.append(noun)
        } else if firstNounTextfield.text == "" {
            let emptyString = Word(word: firstNounTextfield.text!)
            nouns.append(emptyString)
        }
        if let secondNoun = secondNounTextfield.text, !secondNoun.isEmpty {
            let noun = Word(word: secondNoun)
            nouns.append(noun)
        } else if secondNounTextfield.text == "" {
            let emptyString = Word(word: secondNounTextfield.text!)
            nouns.append(emptyString)
        }
        if let thirdNoun = thirdNounTextfield.text,!thirdNoun.isEmpty {
            let noun = Word(word: thirdNoun)
            nouns.append(noun)
        } else if thirdNounTextfield.text == "" {
            let emptyString = Word(word: thirdNounTextfield.text!)
            nouns.append(emptyString)
        }
        if let fourthNoun = fourthNounTextfield.text, !fourthNoun.isEmpty {
            let noun = Word(word: fourthNoun)
            nouns.append(noun)
        } else if fourthNounTextfield.text == "" {
            let emptyString = Word(word: fourthNounTextfield.text!)
            nouns.append(emptyString)
        }
        wordController.addNouns(nouns)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyle()
        firstNounTextfield.delegate = self
        secondNounTextfield.delegate = self
        thirdNounTextfield.delegate = self
        fourthNounTextfield.delegate = self
        texfieldInset()
        styleTextfields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowVerbsSegue" {
            guard let verbsVC = segue.destination as? VerbsViewController else { return }
            verbsVC.wordController = wordController
        }
    }
}

extension NounsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNounTextfield {
            textField.resignFirstResponder()
            secondNounTextfield.becomeFirstResponder()
            return true
        } else if textField == secondNounTextfield {
            textField.resignFirstResponder()
            thirdNounTextfield.becomeFirstResponder()
            return true
        } else if textField == thirdNounTextfield {
            textField.resignFirstResponder()
            fourthNounTextfield.becomeFirstResponder()
            return true
        } else if textField == fourthNounTextfield {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == thirdNounTextfield {
            moveTextField(textfield: textField, moveDistance: -80, up: true)
        } else if textField == fourthNounTextfield {
            moveTextField(textfield: textField, moveDistance: -180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == thirdNounTextfield {
            moveTextField(textfield: textField, moveDistance: 80, up: true)
        } else if textField == fourthNounTextfield {
            moveTextField(textfield: textField, moveDistance: 180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func moveTextField(textfield: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}

extension NounsViewController {
    // styling for the button
    func buttonStyle() {
        addWordButton.layer.cornerRadius = 25
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
//       addWordButton.layer.shadowOpacity = 6
//       addWordButton.layer.shadowRadius = 8
    }
    
    @IBAction func unwindToNoun(_ unwindSegue: UIStoryboardSegue) {
        firstNounTextfield.text = ""
        secondNounTextfield.text = ""
        thirdNounTextfield.text = ""
        fourthNounTextfield.text = ""
        firstNounTextfield.becomeFirstResponder()
    }
    
    func texfieldInset() {
        firstNounTextfield.setLeftPaddingPoints(10)
        secondNounTextfield.setLeftPaddingPoints(10)
        thirdNounTextfield.setLeftPaddingPoints(10)
        fourthNounTextfield.setLeftPaddingPoints(10)
    }
    
    func styleTextfields() {
        
        firstNounTextfield.styleTextfield()
        secondNounTextfield.styleTextfield()
        thirdNounTextfield.styleTextfield()
        fourthNounTextfield.styleTextfield()
    
        borderVIew.layer.cornerRadius = 25
    }
}
