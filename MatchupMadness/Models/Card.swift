//
//  Card.swift
//  MatchupMadness
//
//  Created by Joel Grenier on 2020-12-02.
//  Copyright :copyright: 2020 Swift Project. All rights reserved.
//

import Foundation

class Card {
    var cardId: String
    var hidden: Bool = true
    // not sure how to access image for now, leaving as string
    var cardImage: String
    
    // MARK: Initializers
    init(_ cardId: String, _ hidden: Bool, _ cardImage: String) {
        self.cardId = cardId
        self.hidden = hidden
        self.cardImage = cardImage
    }
    
    init(_ card: Card) {
        self.cardId = card.cardId
        self.hidden = card.hidden
        self.cardImage = card.cardImage
    }
    
    // MARK: Functions
    
    // Function to check if 2 cards match
    func checkMatch(_ card:Card) -> Bool{
        if (card.cardId == self.cardId){
            return true
        }
        else{
            return false
        }
    }
    
    // To create a duplicate card.
    func copyCard()->Card{
        return Card(self)
    }
    
    
    
}
