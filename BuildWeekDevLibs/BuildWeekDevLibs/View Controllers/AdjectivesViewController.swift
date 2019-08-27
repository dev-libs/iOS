//
//  AdjectivesViewController.swift
//  BuildWeekDevLibs
//
//  Created by brian vilchez on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol createAdjectiveDelegate {
    func createAdjectives(with word: [Word])
}


class AdjectivesViewController: UIViewController {


    //MARK: - properties
    @IBOutlet weak var firstAdjectiveLabel: UILabel!
    @IBOutlet weak var secondAdjectiveLabel: UILabel!
    @IBOutlet weak var thirdAdjectiveLabel: UILabel!
    @IBOutlet weak var fourthAdjectiveLabel: UILabel!
    @IBOutlet weak var addWordButton: UIButton!
    var delegate: createAdjectiveDelegate?
    
    //MARK: - actions
    
    @IBAction func addWords(_ sender: UIButton) {
        delegate?.createAdjectives(with: adjectiveWords())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSheet()
    }
    
}

extension AdjectivesViewController {
    
    private func styleSheet() {
        addWordButton.layer.masksToBounds = true
        addWordButton.layer.cornerRadius = 10
        addWordButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        addWordButton.layer.shadowRadius = 5
        addWordButton.layer.shadowOpacity = 0.5
    }
    
    func adjectiveWords() -> [Word] {
        var adjectiveWords: [Word] = []
        if let firstadjective = firstAdjectiveLabel.text,!firstadjective.isEmpty {
            let adjectiveWord = Word(word: firstadjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let secondAdjective = secondAdjectiveLabel.text, !secondAdjective.isEmpty {
            let adjectiveWord = Word(word: secondAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let thirdAdjective = thirdAdjectiveLabel.text, !thirdAdjective.isEmpty {
            let adjectiveWord = Word(word: thirdAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        if let fourthAdjective = fourthAdjectiveLabel.text, !fourthAdjective.isEmpty {
            let adjectiveWord = Word(word: fourthAdjective)
            adjectiveWords.append(adjectiveWord)
        }
        return adjectiveWords
    }
}
