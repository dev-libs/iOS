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
        } else if firstVerb.text == "" {
            let emptyString = Word(word: firstVerb.text!)
            verbs.append(emptyString)
        }
        if let secondVerb = secondVerb.text, !secondVerb.isEmpty {
            let verbWord = Word(word: secondVerb)
            verbs.append(verbWord)
        } else if secondVerb.text == "" {
            let emptyString = Word(word: secondVerb.text!)
            verbs.append(emptyString)
        }
        if let thirdVerb = thirdVerb.text,!thirdVerb.isEmpty {
            let verbWord = Word(word: thirdVerb)
            verbs.append(verbWord)
        } else if thirdVerb.text == "" {
            let emptyString = Word(word: thirdVerb.text!)
            verbs.append(emptyString)
        }
        if let fourthVerb = fourthVerb.text,!fourthVerb.isEmpty {
            let verbWord = Word(word: fourthVerb)
            verbs.append(verbWord)
        } else if fourthVerb.text == "" {
            let emptyString = Word(word: fourthVerb.text!)
            verbs.append(emptyString)
        }
        guard let wordController = wordController else { return }
        wordController.addVerbs(verbs)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstVerb.delegate = self
        secondVerb.delegate = self
        thirdVerb.delegate = self
        fourthVerb.delegate = self
        firstVerb.becomeFirstResponder()
        buttonStyle()
        texfieldInset()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAdjectivesSegue" {
            guard let adjectivesVC = segue.destination as? AdjectivesViewController else { return }
            guard let wordController = wordController else { return }
            adjectivesVC.wordController = wordController
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == thirdVerb {
            moveTextField(textfield: textField, moveDistance: -80, up: true)
        } else if textField == fourthVerb {
            moveTextField(textfield: textField, moveDistance: -180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == thirdVerb {
            moveTextField(textfield: textField, moveDistance: 80, up: true)
        } else if textField == fourthVerb {
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

extension VerbsViewController {
    // button styling
    func buttonStyle() {
        addWordButton.layer.cornerRadius = 15
        addWordButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
        addWordButton.layer.shadowOpacity = 6
        addWordButton.layer.shadowRadius = 8
    }
    
    func texfieldInset() {
        firstVerb.setLeftPaddingPoints(10)
        secondVerb.setLeftPaddingPoints(10)
        thirdVerb.setLeftPaddingPoints(10)
        fourthVerb.setLeftPaddingPoints(10)
    }
}
