//
//  GoalTrackerViewController.swift
//  NewFinalApp
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit

class GoalTrackerViewController: UIViewController {

    var previousGoalTrackerTVC = CompletedGoalTableViewController()
    
    @IBOutlet weak var descriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        let newGoalTracker = GoalTrackerClass()
        
        if let checkForInput = descriptionInput.text {
            newGoalTracker.description = checkForInput
        }
        
        previousGoalTrackerTVC.listOfGoalTracker.append(newGoalTracker)
        previousGoalTrackerTVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
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
