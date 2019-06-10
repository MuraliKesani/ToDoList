//
//  ViewController.swift
//  ToDoList
//
//  Created by Murali on 6/10/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemsArray = ["Swift 4.2","Swift 5 ","SwiftUI"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = itemsArray[indexPath.row]
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Add New itemsArray
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Item", style: UIAlertAction.Style.default) { (action) in
            //What will happen when user clicks the add Button on UIAlert
            
            self.itemsArray.append(textField.text!)
            self.tableView.reloadData()

            //            print(textField.text!)
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create New Item"
            textField = alertTextfield
        
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

