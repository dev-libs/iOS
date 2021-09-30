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

    @IBOutlet weak var firstVerbTextfield: UITextField!
    @IBOutlet weak var secondVerbTextfield: UITextField!
    @IBOutlet weak var thirdVerbTextfield: UITextField!
    @IBOutlet weak var fourthVerbTextfield: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    @IBOutlet weak var borderLayer: UIView!
    
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var verbs: [Word] = []
        if let firstVerb = firstVerbTextfield.text,!firstVerb.isEmpty {
            let verbWord = Word(word: firstVerb)
            verbs.append(verbWord)
        } else if firstVerbTextfield.text == "" {
            let emptyString = Word(word: firstVerbTextfield.text!)
            verbs.append(emptyString)
        }
        if let secondVerb = secondVerbTextfield.text, !secondVerb.isEmpty {
            let verbWord = Word(word: secondVerb)
            verbs.append(verbWord)
        } else if secondVerbTextfield.text == "" {
            let emptyString = Word(word: secondVerbTextfield.text!)
            verbs.append(emptyString)
        }
        if let thirdVerb = thirdVerbTextfield.text,!thirdVerb.isEmpty {
            let verbWord = Word(word: thirdVerb)
            verbs.append(verbWord)
        } else if thirdVerbTextfield.text == "" {
            let emptyString = Word(word: thirdVerbTextfield.text!)
            verbs.append(emptyString)
        }
        if let fourthVerb = fourthVerbTextfield.text,!fourthVerb.isEmpty {
            let verbWord = Word(word: fourthVerb)
            verbs.append(verbWord)
        } else if fourthVerbTextfield.text == "" {
            let emptyString = Word(word: fourthVerbTextfield.text!)
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
        firstVerbTextfield.delegate = self
        secondVerbTextfield.delegate = self
        thirdVerbTextfield.delegate = self
        fourthVerbTextfield.delegate = self
        buttonStyle()
        texfieldInset()
        styleTextfields()
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
        if textField == firstVerbTextfield {
            textField.resignFirstResponder()
            secondVerbTextfield.becomeFirstResponder()
            return true
        } else if textField == secondVerbTextfield {
            textField.resignFirstResponder()
            thirdVerbTextfield.becomeFirstResponder()
            return true
        } else if textField == thirdVerbTextfield {
            textField.resignFirstResponder()
            fourthVerbTextfield.becomeFirstResponder()
            return true
        } else if textField == fourthVerbTextfield {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == thirdVerbTextfield {
            moveTextField(textfield: textField, moveDistance: -80, up: true)
        } else if textField == fourthVerbTextfield {
            moveTextField(textfield: textField, moveDistance: -180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == thirdVerbTextfield {
            moveTextField(textfield: textField, moveDistance: 80, up: true)
        } else if textField == fourthVerbTextfield {
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
        addWordButton.layer.cornerRadius = 25
        addWordButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
        addWordButton.layer.borderColor = #colorLiteral(red: 0.6646977663, green: 0.5280762911, blue: 1, alpha: 1)

    }
    
    func texfieldInset() {
        firstVerbTextfield.setLeftPaddingPoints(10)
        secondVerbTextfield.setLeftPaddingPoints(10)
        thirdVerbTextfield.setLeftPaddingPoints(10)
        fourthVerbTextfield.setLeftPaddingPoints(10)
    }
    
    func styleTextfields() {
        
        // setup corner radius
        firstVerbTextfield.styleTextfield()
        secondVerbTextfield.styleTextfield()
        thirdVerbTextfield.styleTextfield()
        fourthVerbTextfield.styleTextfield()
        
        borderLayer.layer.cornerRadius = 25
    }
}
