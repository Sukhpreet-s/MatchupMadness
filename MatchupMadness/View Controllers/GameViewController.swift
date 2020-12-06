//
//  GameViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-11-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: Properties
    
    var cards: [Card] = []
    
    @IBOutlet weak var GameCollectionView: UICollectionView!
    @IBOutlet weak var movesLabel: UILabel!
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init Game and Cards here.
        loadCards()
        
    }
    
    func loadCards() {
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

}

// MARK: DataSource, Delegate
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       self.cards.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cardCell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
           as! CardCollectionViewCell
       
        cardCell.setCardValue(self.cards[indexPath.row].cardImage)
        cardCell.show(false)
       
       return cardCell
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardCell: CardCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
             
        if cardCell.shown { return }
        cardCell.show(true)
        
    }
    
}
