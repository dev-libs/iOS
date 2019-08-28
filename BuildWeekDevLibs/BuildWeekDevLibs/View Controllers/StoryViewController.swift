//
//  StoryViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - properties
    
    var wordController: WordController?
    //MARK: - outlets
    
    @IBOutlet weak var storyTextView: UITextView!
    
    // MARK: - actions

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let wordController = wordController else { return }
        storyTextView.text = """
        I would like to recommend my \(wordController.nouns[0].word), for the job of assistant \(wordController.nouns[1].word).
        He has just graduated and has a degree in \(wordController.verbs[0].word).
        He has experience teaching \(wordController.nouns[2].word) how to play games.
        He is \(wordController.adjectives[0].word) and \(wordController.adjectives[1].word).
        During vacations, he use to \(wordController.verbs[1].word) our \(wordController.adjectives[2].word) dogs.
        He is smart as a \(wordController.nouns[3].word) and likes to \(wordController.verbs[2].word) for fun.
        Please \(wordController.verbs[3].word) back quickly, because I think he is the most \(wordController.adjectives[3].word) person there has ever been.
        """
    }
}
