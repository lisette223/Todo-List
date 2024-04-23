//
//  AddToDoViewController.swift
//  Todo List
//
//  Created by Lisette Antigua on 4/21/24.
//

import UIKit

class AddToDoViewController: UIViewController {

    var ToDoListTableViewController: ToDoListTableViewController? = nil
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   

    @IBAction func addTapped(_ sender: UIButton) {
        
        
//        let newToDo = ToDo()
//        newToDo.priority = prioritySegment.selectedSegmentIndex
//
//        if let name = nameTextField.text{
//            newToDo.name = name
//        }
//
//        ToDoListTableViewController?.todolist.append(newToDo)
//        ToDoListTableViewController?.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
//
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext    {
            
            let newToDo = ToDoCD(context: context)
            newToDo.priority = Int32(prioritySegment.selectedSegmentIndex)
            if let name = nameTextField.text {
                newToDo.name = name
                
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
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
