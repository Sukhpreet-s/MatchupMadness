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
    @IBOutlet weak var cardValueLabel: UILabel!
    
    // MARK: Functions

    func setCardValue(_ value: String) {
        cardValueLabel.text = value
    }
    
}
