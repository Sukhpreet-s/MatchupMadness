//
//  CardCollectionViewCell.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-12-01.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // Value of the card
    // Should be same for 1 more card to match
    @IBOutlet weak var cardValueLabel: UILabel!
    
    @IBOutlet weak var contentViewBackground: UIView!
    
    // MARK: Functions
    func setCardValue(_ value: String) {
        cardValueLabel.text = value
    }
    
    func displayCard() {
        contentViewBackground.isHidden = false
        cardValueLabel.isHidden = false
        
        contentViewBackground.backgroundColor = UIColor.yellow
    }
    
    func hideCard() {
        cardValueLabel.isHidden = true
        contentViewBackground.backgroundColor = UIColor.black
    }
    
}
