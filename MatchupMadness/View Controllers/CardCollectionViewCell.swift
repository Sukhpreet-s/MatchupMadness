//
//  CardCollectionViewCell.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-12-01.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var cardValueLabel: UILabel!
    
    var frontColor: UIColor = UIColor.cyan
    var backColor: UIColor = UIColor.gray
    
    var shown: Bool = false
    var card: Card? {
        didSet {
            guard let card = card else {return}
            
            self.cardValueLabel.text = card.cardImage
        }
    }
    
    
    // MARK: Functions

    
    func show(_ show: Bool) {
        if show {
            self.backgroundColor = self.frontColor
            self.cardValueLabel.isHidden = false
            self.shown = true
            
        } else {
            self.backgroundColor = self.backColor
            self.cardValueLabel.isHidden = true
            self.shown = false
        }
        
    }
    
}
