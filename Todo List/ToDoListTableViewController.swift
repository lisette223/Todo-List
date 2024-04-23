//
//  ToDoListTableViewController.swift
//  Todo List
//
//  Created by Lisette Antigua on 4/21/24.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    
    var todolist:[ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let todo1 = ToDo()
        todo1.name = "Write chapter one of iOS 14 book"
        todo1.priority = 0
        let todo2 = ToDo()
        todo2.name = "Edit  iOS 14 book"
        todo2.priority = 1
        todolist = [todo1, todo2]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todolist.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let selectedToDo = todolist[indexPath.row]
        if selectedToDo.priority == 1
        {
            cell.textLabel?.text = "❗️" + selectedToDo.name
        }
        else if selectedToDo.priority == 2
        {
            cell.textLabel?.text = "‼️ " + selectedToDo.name
        }
            
        else{
            cell.textLabel?.text =  selectedToDo.name
        }
        
      
      
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addToDoViewController = segue.destination as? AddToDoViewController{
            addToDoViewController.ToDoListTableViewController = self
            
        }
        
        if let detailsToDoViewController = segue.destination as? ToDoDetailsViewController{
            if let selectedToDo = sender as? ToDo{
                detailsToDoViewController.toDo = selectedToDo
            }
        }
    
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = todolist[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }

}
