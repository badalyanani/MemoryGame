//
//  Card.swift
//  memoryGame
//
//  Created by Ani on 9/10/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import Foundation

struct Card {
    var isfaceUp = false
    var isMatched = false
    var indentifier: Int
    
    static var uniqueIndentifier = 0
    
    init() {
        self.indentifier = Card.generateUniqueIndentifier()
    }
    
    static func generateUniqueIndentifier() -> Int {
    uniqueIndentifier += 1
        return uniqueIndentifier
    }
}
