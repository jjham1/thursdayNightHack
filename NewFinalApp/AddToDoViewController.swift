//
//  AddToDoViewController.swift
//  NewFinalApp
//
//  Created by Julie Ham on 8/13/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {

    var previousToDoTVC = ToDoTableViewController()
    
    @IBOutlet weak var descriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonTapped(_ sender: Any) {
//        let newToDo = ToDoClass()
//
//        if let checkForInput = descriptionInput.text {
//             newToDo.description = checkForInput
//        }
//
//        previousToDoTVC.listOfToDo.append(newToDo)
//        previousToDoTVC.tableView.reloadData()
//        navigationController?.popViewController(animated: true)

        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
            let dataFromCoreData = accessToCoreData.persistentContainer.viewContext
            
            let newToDo = ToDoCD(context: dataFromCoreData)
            
            newToDo.descriptionInCD = descriptionInput.text
            
            accessToCoreData.saveContext()
            
            navigationController?.popViewController(animated: true)

    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


