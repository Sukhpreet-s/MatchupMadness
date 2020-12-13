//
//  Game.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-12-13.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation


class Game {
    
    var cards: [Card] = [Card]()
    var visibleCards: [Card] = [Card]()
    
    func initGame() {
        var cards: [Card] = [Card]()
        
        let values: [String] = ["1", "2", "3", "4"]
        
        // Add cards
        
        for value in values {
            let card: Card = Card(value)
            let copy: Card = card.copyCard()
            
            cards.append(card)
            cards.append(copy)
        }
        
        cards.shuffle()
        self.cards = cards
    }
    
    func matchCards(card: Card) -> Bool {
        if visibleCards.count % 2 == 0 {
            // No cards to match.
            return false
        }
        
        guard let prevCard: Card = self.visibleCards.last else {
            return false
        }
        
        if card.checkMatch(prevCard) {
            self.visibleCards.append(card)
            return true
        } else {
            self.visibleCards.removeLast()
            return false
        }
        
    }
    
    func addCardShown(card: Card) {
        self.visibleCards.append(card)
    }
    
}
