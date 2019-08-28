//
//  StoryViewController.swift
//  BuildWeekDevLibs
//
//  Created by Brian Vilchez and Ciara Beitel on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit
protocol CreateStoryDelegate {
    func addwords(with words: [Word])
}


class StoryViewController: UIViewController {
    
    //MARK: - properties
    var delegate: CreateStoryDelegate?
    //MARK: - outlets
    
    @IBOutlet weak var storyTextView: UITextView!
    
    // MARK: - actions

    @IBAction func shareButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
       
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




