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
    
    var seconds: Int = 0
    var timer = Timer()
    
    var prevFlippedCardIndex: IndexPath?
    var game: Game = Game()
    
    @IBOutlet weak var GameCollectionView: UICollectionView!
    @IBOutlet weak var movesLabel: UILabel!
    
    @IBOutlet weak var gameEndLabel: UILabel!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init Game and Cards here.

        self.game.initGame()
        
        self.GameCollectionView.isUserInteractionEnabled = false
        self.gameEndLabel.isHidden = true
        self.statsButton.isHidden = true
        self.startButton.isHidden = false
    
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        // Game start functionality
        self.GameCollectionView.isUserInteractionEnabled = true
        runTimer()
        
    }
    
    
    @IBAction func goToStatsAction(_ sender: UIButton) {
        let vc: StatsViewController = self.storyboard?.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
        
        vc.currentScore = self.seconds
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        self.seconds += 1
        self.movesLabel.text = Game.getTimeLabelValue(self.seconds)
    }
    

    func stopGame() {
        
        // Stop the timer
        self.timer.invalidate()
        // display a message for game finished.
        self.gameEndLabel.isHidden = false
        // Display the button to go to Stats page.
        self.statsButton.isHidden = false
        // Hide the Start button
        self.startButton.isHidden = true
        //write time to db here
        createData()
    }
    func createData(){
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let scoreboardEntity = NSEntityDescription.entity(forEntityName: "Scoreboard", in: managedContext);

           
            let score = NSManagedObject(entity: scoreboardEntity!, insertInto: managedContext)
            score.setValue(seconds, forKey: "time");
        
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
            
            // Game end logic
            if self.game.hasEnded() {
                stopGame()
            }
            
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
