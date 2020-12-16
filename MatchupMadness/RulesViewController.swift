//
//  RulesViewController.swift
//  MatchupMadness
//
//  Created by Steven Caird on 2020-12-15.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var lblRules: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblRules.text =
            
            "* player chooses two cards to be turned face up\n"
        +
            "\n * If the selected cards are of the same value then the pair remains face up and the player chooses their next pair\n"
        +
            "\n * If the selected cards have different values they are returned to the face down position and the player chooses their next pair \n"
        +
            "\n * The game continues until the user has matched all pair so that all cards are face up"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
