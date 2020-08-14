//
//  CompletedGoalTableViewController.swift
//  NewFinalApp
//
//  Created by Julie Ham on 8/12/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit

class CompletedGoalTableViewController: UITableViewController {

    var listOfGoalTracker : [GoalTrackerClass] = []
    
    func createGoalTracker() -> [GoalTrackerClass] {
        
        let swiftGoalTracker = GoalTrackerClass()
        swiftGoalTracker.description = "Learn Swift"
        
        let dogGoalTracker = GoalTrackerClass()
        dogGoalTracker.description = "Walk dog"
        
        return[swiftGoalTracker, dogGoalTracker]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfGoalTracker = createGoalTracker()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfGoalTracker.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachGoalTracker = listOfGoalTracker[indexPath.row]
        cell.textLabel?.text = eachGoalTracker.description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addGoalTrackerVC = segue.destination as? GoalTrackerViewController {
            addGoalTrackerVC.previousGoalTrackerTVC = self
        }
       
        if let nextCompletedGoalTrackerVC = segue.destination as? CompletedTableViewController {
             if let choosenGoalTracker = sender as? GoalTrackerClass {
                  nextCompletedGoalTrackerVC.selectedGoalTracker = choosenGoalTracker
                  nextCompletedGoalTrackerVC.previousGoalTrackerTVC = self
             }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachGoalTracker = listOfGoalTracker[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedGoalTrackerVC", sender: eachGoalTracker)
    }


}
