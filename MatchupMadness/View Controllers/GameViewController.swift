//
//  GameViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-11-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let cards: [Card] = [
        Card("1"),
        Card("2"),
        Card("3"),
        Card("4")
    ]
    
    // MARK: Properties
    @IBOutlet weak var GameCollectionView: UICollectionView!
    
    @IBOutlet weak var movesLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        GameCollectionView.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    

}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
            as! CardCollectionViewCell
        
        cardCell.cardValueLabel.text = self.cards[indexPath.row].cardImage
        
        //cardCell.setCardValue(self.cards[indexPath.row].cardImage)
        //cardCell.displayCard()
        
        return cardCell
    }
    
    
}
