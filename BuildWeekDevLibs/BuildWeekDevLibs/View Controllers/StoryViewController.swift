//
//  StoryViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    //MARK: - properties
    var wordController: WordController?
    var nounDelegate: CreateNounDelegate?
    var verbDelegate: CreateVerbDelegate?
    var adjectiveDelegate: CreateAdjectiveDelegate?
    //MARK: - outlets
    
    @IBOutlet weak var storyTextView: UITextView!
    
    // MARK: - actions

    @IBAction func shareButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        if let wordController = wordController{
        for noun in wordController.nouns {
      
            print("noun: \(noun.word)")
        }
        }
    }

    func updateViews() {
        storyTextView.text = "HIIIIII!!!!!"
       // for noun in wordController.nouns {
           // storyTextView.text += "\(noun.word) /n"
   
    }

    func showStory() {
//      //  guard let wordController = wordController else {return}
//        for (_ , element) in wordController.nouns.enumerated() {
//            storyTextView.text = """
//            Forget the fat lady! \(element.word) You're obsessed with the fat lady! Drive us out of here! Yes, Yes, without the oops! I was part of something special. I was part of something special. I gave it a cold? I gave it a virus. A computer virus. They're using our own satellites against us. And the clock is ticking.
//            Must go faster. This thing comes fully loaded. AM/FM radio, reclining bucket seats, and... power windows. Eventually, you do plan to have dinosaurs on your dinosaur tour, right? Remind me to thank John for a lovely weekend. God creates dinosaurs. God destroys dinosaurs. God creates Man. Man destroys God. Man creates Dinosaurs.
//            """
//        }
//
    }

}
extension StoryViewController: CreateNounDelegate, CreateVerbDelegate, CreateAdjectiveDelegate{
    
    func createAdjectives(with words: [Word]) {
        adjectiveDelegate = self
        wordController?.addAdjectives(words)
        print(words)
    }
    
    func createVerbs(with words: [Word]) {
        verbDelegate = self
        wordController?.addVerbs(words)
        print(words)
    }
    
    func createNouns(with words: [Word]) {
        nounDelegate = self
        wordController?.addNouns(words)
        print(words)
    }
}


