//
//  AdjectivesViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol CreateAdjectiveDelegate {
    func createAdjectives(with words: [Word])
}

class AdjectivesViewController: UIViewController {
    
    //MARK: - properties
    var wordController = WordController()
    var delegate: CreateAdjectiveDelegate?

    //MARK: - outlets
    
    @IBOutlet weak var firstAdjective: UITextField!
    @IBOutlet weak var secondAdjective: UITextField!
    @IBOutlet weak var thirdAdjective: UITextField!
    @IBOutlet weak var fourthAdjective: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        delegate?.createAdjectives(with: adjectiveWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //styleSheet()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryDetailShowSegue" {
            guard let storyDetailVC = segue.destination as? StoryViewController else {return}
            storyDetailVC.wordController = wordController
        }
    }
}

extension AdjectivesViewController {
    
//    private func styleSheet() {
//        addWordButton.layer.masksToBounds = true
//        addWordButton.layer.cornerRadius = 10
//        addWordButton.layer.shadowOffset = CGSize(width: 3, height: 3)
//        addWordButton.layer.shadowRadius = 5
//        addWordButton.layer.shadowOpacity = 0.5
//    }
    
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
}
