//
//  memoryGame.swift
//  memoryGame
//
//  Created by Ani on 9/10/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import Foundation

class MemoryGame {
    
    var cards = Array<Card>()
    
    var indexOfOnleyOneCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched {
            
            if  let match = indexOfOnleyOneCard {
                if(match != index) {
                    if cards[match].indentifier == cards[index].indentifier {
                        cards[index].isMatched = true
                        cards[match].isMatched = true
                    }
                    cards[index].isfaceUp = true
                    indexOfOnleyOneCard = nil
                }
            }else {
                for i in cards.indices{
                    cards[i].isfaceUp = false
                }
                cards[index].isfaceUp = true
                indexOfOnleyOneCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
        let card = Card()
           // let matchCard = card
            cards.append(card)
            cards.append(card)
    }
        //TODO: shuffle card
    }
}
