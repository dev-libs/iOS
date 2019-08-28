//
//  WordController.swift
//  BuildWeekDevLibs
//
//  Created by brian vilchez on 8/27/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class WordController {
    
    private(set) var nouns: [Word]
    private(set) var verbs: [Word]
    private(set) var adjectives: [Word]
    
    init() {
        nouns = []
        verbs = []
        adjectives = []
    }
    
    func addNouns(_ incomingNouns: [Word]) {
        nouns.append(contentsOf: incomingNouns)
    }
    
    func addVerbs(_ incomingVerbs:[Word]) {
        verbs.append(contentsOf: incomingVerbs)
    }
    
    func addAdjectives(_ incomingAdjectives: [Word]){
        adjectives.append(contentsOf: incomingAdjectives)
    }
}
extension WordController {
    
    func createNouns(with words: [Word]) {
        addNouns(words)
    }
    
    func createVerbs(with words: [Word]) {
        addVerbs(words)
    }
    
    func createAdjectives(with words: [Word]) {
        addAdjectives(words)
    }
    
    
    
}
