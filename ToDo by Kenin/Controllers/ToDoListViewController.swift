//
//  ToDoListViewController.swift
//  ToDo by Kenin
//
//  Created by Kenin Page on 2/6/18.
//  Copyright © 2018 Kenin Page. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
    }

    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary Operator -->
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - Create TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK - Add new items
    @IBAction func addNewItemPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when the user clicks the add button on our UIAlert
            if textField.text != "" {
                
                let newItem = Item()
                newItem.title = textField.text!
                
                self.itemArray.append(newItem)
                
                self.saveItems()
                
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item."
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
     }
    //MARK - Model Manipulaton Items
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("data failed to encode item array \(error)")
        }
        self.tableView.reloadData()

    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("data failed to load to item array \(error)")
            }
        }
        
        self.tableView.reloadData()

    }
    
}

