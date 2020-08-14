//
//  ToDoTableViewController.swift
//  NewFinalApp
//
//  Created by Julie Ham on 8/13/20.
//  Copyright © 2020 Meghan Jachna. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoCD] = []

    func getToDos() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
              listOfToDo = dataFromCoreData
              tableView.reloadData()
              }
         }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text =
        eachToDo.descriptionInCD

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let nextAddToDoVC = segue.destination as? AddToDoViewController {
              nextAddToDoVC.previousToDoTVC = self
         }

         if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
              if let choosenToDo = sender as? ToDoCD {
                   nextCompletedToDoVC.selectedToDo = choosenToDo
                   nextCompletedToDoVC.previousToDoTVC = self
              }
         }
    }

    override func viewWillAppear(_ animated: Bool) {
         getToDos()
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let eachToDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }

}
