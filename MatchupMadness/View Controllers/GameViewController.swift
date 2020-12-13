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
    
    var prevFlippedCardIndex: IndexPath?
    var game: Game = Game()
    
    @IBOutlet weak var GameCollectionView: UICollectionView!
    @IBOutlet weak var movesLabel: UILabel!
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init Game and Cards here.
        self.game.initGame()
        
    }

}

// MARK: DataSource, Delegate
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.game.cards.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cardCell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
           as! CardCollectionViewCell
       
        cardCell.card = self.game.cards[indexPath.row]
        cardCell.show(false)
       
       return cardCell
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardCell: CardCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        guard let card = cardCell.card else {return}
             
        // If tapped card is already shown, no need to any further.
        if cardCell.shown { return }
        
        // Show the card
        cardCell.show(true)
        
        // If no other card is flipped, store current card's indexPath and no need to go further.
        guard let prevFlippedCardIndex = self.prevFlippedCardIndex else {
            self.prevFlippedCardIndex = indexPath
            self.game.addCardShown(card: card)
            return
        }
        
        
        // If one more card is already flipped
        if self.game.matchCards(card: card) {
            self.prevFlippedCardIndex = nil
            return
        } else {
            
            let prevCardCell: CardCollectionViewCell = collectionView.cellForItem(at: prevFlippedCardIndex) as! CardCollectionViewCell
            
            // Reset the previous flipped card indexPath value
            self.prevFlippedCardIndex = nil
            
            // Hide the card after 0.5 seconds.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                           
                cardCell.show(false)
                prevCardCell.show(false)
            }
        }
        
        
        
        
        
        
    }
    
}
