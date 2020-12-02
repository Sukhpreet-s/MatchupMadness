//
//  StatsViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-12-01.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var previousMovesLabel: UILabel!
    
    // Hide it if user is logged in
    @IBOutlet weak var loginMessageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
