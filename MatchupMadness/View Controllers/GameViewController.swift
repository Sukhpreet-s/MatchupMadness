//
//  GameViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-11-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cards: [Card] = [
        Card("1"),
        Card("2"),
        Card("3"),
        Card("4"),
        Card("5"),
        Card("6"),
        Card("7"),
        Card("8")
    ]
    
    // MARK: Properties
    @IBOutlet weak var GameCollectionView: UICollectionView!
    
    @IBOutlet weak var movesLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
            as! CardCollectionViewCell
        
        cardCell.setCardValue(self.cards[indexPath.row].cardImage)
        cardCell.backgroundColor = UIColor.cyan
        
        return cardCell
    }

}
