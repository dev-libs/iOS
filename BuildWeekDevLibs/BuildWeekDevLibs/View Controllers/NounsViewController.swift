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
    
    @IBOutlet weak var firstNoun: UITextField!
    @IBOutlet weak var secondNoun: UITextField!
    @IBOutlet weak var thirdNoun: UITextField!
    @IBOutlet weak var fourthNoun: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    @IBOutlet weak var borderVIew: UIView!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var nouns: [Word] = []
        
        if let firstNoun = firstNoun.text,!firstNoun.isEmpty {
            let noun = Word(word: firstNoun)
            nouns.append(noun)
        } else if firstNoun.text == "" {
            let emptyString = Word(word: firstNoun.text!)
            nouns.append(emptyString)
        }
        if let secondNoun = secondNoun.text, !secondNoun.isEmpty {
            let noun = Word(word: secondNoun)
            nouns.append(noun)
        } else if secondNoun.text == "" {
            let emptyString = Word(word: secondNoun.text!)
            nouns.append(emptyString)
        }
        if let thirdNoun = thirdNoun.text,!thirdNoun.isEmpty {
            let noun = Word(word: thirdNoun)
            nouns.append(noun)
        } else if thirdNoun.text == "" {
            let emptyString = Word(word: thirdNoun.text!)
            nouns.append(emptyString)
        }
        if let fourthNoun = fourthNoun.text, !fourthNoun.isEmpty {
            let noun = Word(word: fourthNoun)
            nouns.append(noun)
        } else if fourthNoun.text == "" {
            let emptyString = Word(word: fourthNoun.text!)
            nouns.append(emptyString)
        }
        wordController.addNouns(nouns)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyle()
        firstNoun.delegate = self
        secondNoun.delegate = self
        thirdNoun.delegate = self
        fourthNoun.delegate = self
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == thirdNoun {
            moveTextField(textfield: textField, moveDistance: -80, up: true)
        } else if textField == fourthNoun {
            moveTextField(textfield: textField, moveDistance: -180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == thirdNoun {
            moveTextField(textfield: textField, moveDistance: 80, up: true)
        } else if textField == fourthNoun {
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
        firstNoun.text = ""
        secondNoun.text = ""
        thirdNoun.text = ""
        fourthNoun.text = ""
        firstNoun.becomeFirstResponder()
    }
    
    func texfieldInset() {
        firstNoun.setLeftPaddingPoints(10)
        secondNoun.setLeftPaddingPoints(10)
        thirdNoun.setLeftPaddingPoints(10)
        fourthNoun.setLeftPaddingPoints(10)
    }
    
    func styleTextfields() {
        
        // setup corner radius
        firstNoun.layer.cornerRadius = 10
        secondNoun.layer.cornerRadius = 10
        thirdNoun.layer.cornerRadius = 10
        fourthNoun.layer.cornerRadius = 10
        
        // setup shadow radius
        //UIColor(red: 13, green: 13, blue: 13, alpha: 1).cgColor
        firstNoun.layer.shadowColor = CGColor(red: 247.0, green: 247.0, blue: 247.0, alpha: 1)
        secondNoun.layer.shadowColor = CGColor(red: 247.0, green: 247.0, blue: 247.0, alpha: 1)
        thirdNoun.layer.shadowColor = CGColor(red: 247.0, green: 247.0, blue: 247.0, alpha: 1)
        fourthNoun.layer.shadowColor = CGColor(red: 247.0, green: 247.0, blue: 247.0, alpha: 1)
        
        //
       // firstNoun.layer.shadowOffset = CGSize.zero
        secondNoun.layer.shadowOffset = CGSize.zero
        thirdNoun.layer.shadowOffset = CGSize.zero
        fourthNoun.layer.shadowOffset = CGSize.zero
        
        // add shadow color
        firstNoun.layer.shadowRadius = 10
        secondNoun.layer.shadowRadius = 10
        thirdNoun.layer.shadowRadius = 10
        fourthNoun.layer.shadowRadius = 10
        
        //
        firstNoun.layer.shadowOpacity = 10
        secondNoun.layer.shadowOpacity = 5
        thirdNoun.layer.shadowOpacity = 5
        fourthNoun.layer.shadowOpacity = 5
        
        firstNoun.borderStyle = .none
        secondNoun.borderStyle = .none
        thirdNoun.borderStyle = .none
        fourthNoun.borderStyle = .none
        
        // remove masksToBounds
        firstNoun.layer.masksToBounds = false
        secondNoun.layer.masksToBounds = false
        thirdNoun.layer.masksToBounds = false
        fourthNoun.layer.masksToBounds = false
        
        borderVIew.layer.cornerRadius = 25
    }
}
