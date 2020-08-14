//
//  CompletedTableViewController.swift
//  NewFinalApp
//
//  Created by Julie Ham on 8/12/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit

class CompletedTableViewController: UITableViewController {
    
    var previousGoalTrackerTVC = GoalTrackerViewController()
    var selectedGoalTracker = GoalTrackerClass()


    
    @IBOutlet weak var goalTrackerDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            goalTrackerDisplay.text = selectedGoalTracker.description

    }

    @IBAction func completedTapped(_ sender: UIButton) {
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfGoalTracker.count
    }

}
