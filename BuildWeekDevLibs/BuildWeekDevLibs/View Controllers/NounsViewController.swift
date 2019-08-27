//
//  NounsViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol  CreateNounDelegate {
    func createWords(with words: [Word])
}

class NounsViewController: UIViewController {

    //MARK: - properties
    
    var delegate: CreateNounDelegate?
    
    //MARK: - outlets

    @IBOutlet weak var firstNoun: UITextField!
    @IBOutlet weak var secondNoun: UITextField!
    @IBOutlet weak var thirdNoun: UITextField!
    @IBOutlet weak var fourthNoun: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    // MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        delegate?.createWords(with:nounWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //styleSheet()
    }
}

extension NounsViewController {
    
//    private func styleSheet() {
//        addWordButton.layer.masksToBounds = true
//        addWordButton.layer.cornerRadius = 10
//        addWordButton.layer.shadowOffset = CGSize(width: 3, height: 3)
//        addWordButton.layer.shadowRadius = 5
//        addWordButton.layer.shadowOpacity = 0.5
//    }
    
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
