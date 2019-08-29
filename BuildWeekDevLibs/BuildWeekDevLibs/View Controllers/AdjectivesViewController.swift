//
//  AdjectivesViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit



class AdjectivesViewController: UIViewController {
    
    //MARK: - properties
    var delegate: CreateStoryDelegate?
    
    //MARK: - outlets
    
    @IBOutlet weak var firstAdjective: UITextField!
    @IBOutlet weak var secondAdjective: UITextField!
    @IBOutlet weak var thirdAdjective: UITextField!
    @IBOutlet weak var fourthAdjective: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    @IBAction func backArrowButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addWords(_ sender: UIButton) {
       addwords(with: adjectiveWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }

}

extension AdjectivesViewController {
    
    private func styleSheet() {
        
        addWordButton.layer.cornerRadius = 15
        addWordButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addWordButton.layer.shadowOffset = CGSize(width: addWordButton.layer.borderWidth, height: 9)
        addWordButton.layer.masksToBounds = false
        addWordButton.layer.shadowOpacity = 6
        

    }
    
    func adjectiveWords() -> [Word] {
        var adjectiveWords: [Word] = []
        if let firstadjective = firstAdjective.text,!firstadjective.isEmpty {
            let adjectiveWord = Word(word: firstadjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let secondAdjective = secondAdjective.text, !secondAdjective.isEmpty {
            let adjectiveWord = Word(word: secondAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let thirdAdjective = thirdAdjective.text, !thirdAdjective.isEmpty {
            let adjectiveWord = Word(word: thirdAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let fourthAdjective = fourthAdjective.text, !fourthAdjective.isEmpty {
            let adjectiveWord = Word(word: fourthAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        return adjectiveWords
    }
<<<<<<< Updated upstream
}
extension AdjectivesViewController: CreateStoryDelegate {
    func addwords(with words: [Word]) {
        let wordController = WordController()
        wordController.addAdjectives(words)
        print(wordController.nouns.count)
        print(wordController.verbs.count)
        print(wordController.adjectives.count)
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        addWordButton.styleSheet()
        firstAdjective.becomeFirstResponder()
        firstAdjective.delegate = self
        secondAdjective.delegate = self
        thirdAdjective.delegate = self
        fourthAdjective.delegate = self
>>>>>>> Stashed changes
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryDetailShowSegue" {
            guard let storyVC = segue.destination as? StoryViewController else {return}
            storyVC.delegate = self
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
}
