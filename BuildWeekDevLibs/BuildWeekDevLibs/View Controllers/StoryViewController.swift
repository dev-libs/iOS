//
//  StoryViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/28/19.
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
    @IBAction func playAgainButton(_ sender: Any) {
    navigationController?.popToViewController(NounsViewController(), animated: true)
        wordController?.removeElements()
    }
    
    func updateViews() {
        guard let wordController = wordController else { return }
        storyTextView.text = """
        Python can be a real \(wordController.adjectives[0].word). In order to \(wordController.verbs[0].word)
        an app you will need to add 4 sets of color code. Next you will input a \(wordController.nouns[0].word).
        Finally, be sure to \(wordController.verbs[1].word) the \(wordController.nouns[1].word) before you run the \(wordController.nouns[2].word). What happens after will amaze \(wordController.nouns[3].word)!
        Just \(wordController.verbs[2].word) the app and see your \(wordController.adjectives[1].word) app.
        """
    }
}
