//
//  AdjectivesViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/28/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class AdjectivesViewController: UIViewController {
    
    //MARK: - properties
    
    var wordController: WordController?

    //MARK: - outlets
    
    @IBOutlet weak var firstAdjective: UITextField!
    @IBOutlet weak var secondAdjective: UITextField!
    @IBOutlet weak var thirdAdjective: UITextField!
    @IBOutlet weak var fourthAdjective: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        var adjectives: [Word] = []
        if let firstAdjective = firstAdjective.text,!firstAdjective.isEmpty {
            let adjectiveWord = Word(word: firstAdjective)
            adjectives.append(adjectiveWord)
        } else if firstAdjective.text == "" {
            let emptyString = Word(word: firstAdjective.text!)
            adjectives.append(emptyString)
        }
        if let secondAdjective = secondAdjective.text, !secondAdjective.isEmpty {
            let adjectiveWord = Word(word: secondAdjective)
            adjectives.append(adjectiveWord)
        } else if secondAdjective.text == "" {
            let emptyString = Word(word: secondAdjective.text!)
            adjectives.append(emptyString)
        }
        if let thirdAdjective = thirdAdjective.text, !thirdAdjective.isEmpty {
            let adjectiveWord = Word(word: thirdAdjective)
            adjectives.append(adjectiveWord)
        } else if thirdAdjective.text == "" {
            let emptyString = Word(word: thirdAdjective.text!)
            adjectives.append(emptyString)
        }
        if let fourthAdjective = fourthAdjective.text, !fourthAdjective.isEmpty {
            let adjectiveWord = Word(word: fourthAdjective)
            adjectives.append(adjectiveWord)
        } else if fourthAdjective.text == "" {
            let emptyString = Word(word: fourthAdjective.text!)
            adjectives.append(emptyString)
        }
        guard let wordController = wordController else { return }
        wordController.addAdjectives(adjectives)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstAdjective.delegate = self
        secondAdjective.delegate = self
        thirdAdjective.delegate = self
        fourthAdjective.delegate = self
        firstAdjective.becomeFirstResponder()
        buttonStyle()
        texfieldInset()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStorySegue" {
            guard let storyVC = segue.destination as? StoryViewController else { return }
            guard let wordController = wordController else { return }
            storyVC.wordController = wordController
        }
    }
}

extension AdjectivesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstAdjective {
            textField.resignFirstResponder()
            secondAdjective.becomeFirstResponder()
            return true
        } else if textField == secondAdjective {
            textField.resignFirstResponder()
            thirdAdjective.becomeFirstResponder()
            return true
        } else if textField == thirdAdjective {
            textField.resignFirstResponder()
            fourthAdjective.becomeFirstResponder()
            return true
        } else if textField == fourthAdjective {
            textField.resignFirstResponder()
            return true
        } else {
            return false 
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == thirdAdjective {
            moveTextField(textfield: textField, moveDistance: -80, up: true)
        } else if textField == fourthAdjective {
            moveTextField(textfield: textField, moveDistance: -180, up: true)
        } else {
            moveTextField(textfield: textField, moveDistance: 0, up: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == thirdAdjective {
            moveTextField(textfield: textField, moveDistance: 80, up: true)
        } else if textField == fourthAdjective {
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

extension AdjectivesViewController {
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
        firstAdjective.setLeftPaddingPoints(10)
        secondAdjective.setLeftPaddingPoints(10)
        thirdAdjective.setLeftPaddingPoints(10)
        fourthAdjective.setLeftPaddingPoints(10)
    }
}
