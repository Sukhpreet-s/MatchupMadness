//
//  StatsViewController.swift
//  MatchupMadness
//
//  Created by Joel Grenier on 2020-12-01.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import CoreData

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //set up number of rows and cell content for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "row")
        tempCell?.textLabel?.text = times[indexPath.row]
        tempCell?.textLabel?.textAlignment = .center
        return tempCell!
    }
    
    
    // MARK: Properties
    var scores: [Scoreboard] = []
    var times: [String] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchScores()->[String] {
       // let  = NSFetchRequest<NSFetchRequestResult>(entityName: "Scoreboard")
        let scoresFetch:NSFetchRequest<Scoreboard> = Scoreboard.fetchRequest()
        let timeSort = NSSortDescriptor(key:"time", ascending:true)
        scoresFetch.sortDescriptors = [timeSort]

        scores = try! context.fetch(scoresFetch);
        for score in scores
        {
            let formatted = Game.getTimeLabelValue(Int(score.time)) + " minutes"
            times.append(formatted)
           
        }
        
        return times;
    }
    
   
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var previousMovesLabel: UILabel!
    
    @IBOutlet weak var highscoreTableView: UITableView!
    
    var currentScore: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        times = fetchScores();
        highscoreTableView.register(UITableViewCell.self,
                                    forCellReuseIdentifier: "row")
        highscoreTableView.delegate = self
        highscoreTableView.dataSource = self
        highscoreTableView.reloadData()
        
        movesLabel.text = Game.getTimeLabelValue(currentScore) + " minutes"
        
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - Table Data Source
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
