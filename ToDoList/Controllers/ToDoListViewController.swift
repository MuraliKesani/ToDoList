//
//  ViewController.swift
//  ToDoList
//
//  Created by Murali on 6/10/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

//    var itemsArray = ["Swift 4.2","Swift 5 ","SwiftUI"," 4.2"," 5 ","dasdasdsa"," 4.2"," 5 ","sdasd","Swasdasift 4.2","Swasdasdift 5 ","SwiasdasdftUI","Swiasdasdft 4.2","Swiasdasdft 5 ","asd"," 4.2"," 5 ","dasdasdsa"," 4.2"," 5 ","sdasd","Swasdasift 4.2","Swasdasdift 5 ","SwiasdasdftUI","Swiasdasdft 4.2","Swiasdasdft 5 ","asd"]
    var itemsArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Swift 4.2"
        itemsArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Swift 5"
        itemsArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "SwiftUI"
        itemsArray.append(newItem3)
      
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]
        {
            itemsArray = items
        }
        
        tableView.tableFooterView = UIView.init(frame:CGRect.zero)
        //tableView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
       
    }
    
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsArray.count
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.clear
//        return headerView
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        // add border and color
//        cell.backgroundColor = UIColor.white
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 8
//        cell.clipsToBounds = true
//
        cell.accessoryType = item.done == true ? .checkmark : .none
//        if item.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        itemsArray[indexPath.row].done = !itemsArray[indexPath.row].done
//        if itemsArray[indexPath.row].done == false{
//            itemsArray[indexPath.row].done = true
//        }else{
//            itemsArray[indexPath.row].done = false
//        }
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
//        {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    
    //MARK:- Add New itemsArray
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Item", style: UIAlertAction.Style.default) { (action) in
            //What will happen when user clicks the add Button on UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemsArray.append(newItem)
            self.defaults.set(self.itemsArray, forKey: "TodoListArray")
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

