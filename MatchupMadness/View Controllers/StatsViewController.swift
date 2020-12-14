//
//  StatsViewController.swift
//  MatchupMadness
//
//  Created by Sukhpreet Singh on 2020-12-01.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import CoreData

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //set up number of rows and cell content for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchScores().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "row")
        tempCell?.textLabel?.text = fetchScores()[indexPath.row]
        return tempCell!
    }
    
    
     // MARK: Properties
     var scores: [Scoreboard] = []
    var times: [String] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchScores()->[String] {
       // let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scoreboard")
        scores = try! context.fetch(Scoreboard.fetchRequest());
        for score in scores
        {
            times.append(String(score.time))
           
        }
         return times;
    }
    
   
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var previousMovesLabel: UILabel!
    
    @IBOutlet weak var highscoreTableView: UITableView!
    // Hide it if user is logged in
    @IBOutlet weak var loginMessageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
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
