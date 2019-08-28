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
        }
        if let secondAdjective = secondAdjective.text, !secondAdjective.isEmpty {
            let adjectiveWord = Word(word: secondAdjective)
            adjectives.append(adjectiveWord)
        }
        if let thirdAdjective = thirdAdjective.text, !thirdAdjective.isEmpty {
            let adjectiveWord = Word(word: thirdAdjective)
            adjectives.append(adjectiveWord)
        }
        if let fourthAdjective = fourthAdjective.text, !fourthAdjective.isEmpty {
            let adjectiveWord = Word(word: fourthAdjective)
            adjectives.append(adjectiveWord)
        }
        guard let wordController = wordController else { return }
        wordController.addAdjectives(adjectives)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStorySegue" {
            guard let storyVC = segue.destination as? StoryViewController else { return }
            guard let wordController = wordController else { return }
            storyVC.wordController = wordController
        }
    }
}
