//
//  ViewController.swift
//  ToDoList
//
//  Created by Murali on 6/10/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let items = ["Swift 4.2","Swift 5 ","SwiftUI"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
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
    
    
}

