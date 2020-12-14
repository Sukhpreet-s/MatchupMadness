//
//  GameViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-11-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import CoreData
import UIKit

class GameViewController: UIViewController {
    
    // MARK: Properties
    
    var prevFlippedCardIndex: IndexPath?
    var cards: [Card] = []
    
    @IBOutlet weak var GameCollectionView: UICollectionView!
    @IBOutlet weak var movesLabel: UILabel!
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init Game and Cards here.
        loadCards()
        createData()
        
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
    func createData(){
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let scoreboardEntity = NSEntityDescription.entity(forEntityName: "Scoreboard", in: managedContext);
        
        for i in 1...5{
            var random = Int.random(in:50...150)
            let score = NSManagedObject(entity: scoreboardEntity!, insertInto: managedContext)
            score.setValue(random, forKey: "time");
        }
        do{
            try managedContext.save()
        }
        catch let error as NSError {
            print("Something went wrong. \(error), \(error.userInfo)")
        }
        
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
             
        // If tapped card is already shown, no need to any further.
        if cardCell.shown { return }
        
        // Show the card
        cardCell.show(true)
        
        
        
        // If no other card is flipped, store current card's indexPath and no need to go further.
        guard let prevFlippedCardIndex = self.prevFlippedCardIndex else {
            self.prevFlippedCardIndex = indexPath
            return
        }
        
        
        
        // If one more card is already flipped
        // TODO: Match prev card with current card
        let prevCardCell: CardCollectionViewCell = collectionView.cellForItem(at: prevFlippedCardIndex) as! CardCollectionViewCell
        
        // Reset the previous flipped card indexPath value
        self.prevFlippedCardIndex = nil
        
        
        // Run the following if both cards does NOT match.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                       
            cardCell.show(false)
            prevCardCell.show(false)
        }
        
        
        
    }
    
}
