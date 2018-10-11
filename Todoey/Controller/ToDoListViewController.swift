//
//  ViewController.swift
//  Todoey
//
//  Created by Frank Chen on 2018-10-10.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Todo]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Todo()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Todo()
        newItem2.title = "Find Mike"
        itemArray.append(newItem2)
        
        let newItem3 = Todo()
        newItem3.title = "Find Mike"
        itemArray.append(newItem3)

        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "ToDoListArray") as? [Todo] {
            itemArray = items
        }
    }
    
    
    //MARK -TABLEVIEW DATASORUCE METHODS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operation
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //TABLEVIEW DELEGATE METHODS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       
        tableView.reloadData()
  
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - ADD NEW ITEMS
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message:"", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Todo()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create A New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated:true, completion: nil)
    }
    

}

