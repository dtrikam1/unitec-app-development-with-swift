//
//  ViewController.swift
//  Fruit List
//
//  Created by Hayden Do on 5/09/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddFruitDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var fruitList: [Fruit] = [Fruit(emoji: "🍉", name: "Watermelon", description: "A type of melon", price: 5), Fruit(emoji: "🍓", name: "Strawberry", description: "This a strawberry", price: 3.20), Fruit(emoji: "🥝", name: "Kiwi Fruit", description: "Yum", price: 4.50)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func editButtonPress(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    func addFruit(fruit: Fruit) {
        fruitList.append(fruit)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddFruitTableTableViewController {
            destination.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            fruitList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruit = fruitList[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FruitTableViewCell {
            cell.update(fruit: fruit)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)")
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory Selected Row: \(indexPath.row)")
    }
}

struct Fruit {
    let emoji: String
    let name: String
    let description: String
    let price: Double
}

protocol AddFruitDelegate {
    func addFruit(fruit: Fruit)
}
