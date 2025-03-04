//
//  ViewController.swift
//  CoreDataTable
//
//  Created by Maxwell, Jeff on 3/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var items: [PlayerScore]?
    
    func loadData() {
        do {
            self.items = try self.context?.fetch(PlayerScore.fetchRequest())
            
            self.tableView.reloadData()
        } catch {
            print("Error Loading Data")
        }
    }
    
    func saveAndReload() {
        do {
            try self.context!.save()
        } catch {
            print("Error Saving")
        }
        
        self.loadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = items![indexPath.row]
        cell.textLabel?.text = person.playerName!
        cell.detailTextLabel?.text = String(person.score)
        
        return cell
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Person", message: "What is the person's name?", preferredStyle: .alert)
        alert.addTextField()
        
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let textField = alert.textFields![0]

            // Unwrap context safely
            guard let context = self.context else { return }

            let newPerson = PlayerScore(context: context)
            newPerson.playerName = textField.text
            newPerson.score = Int64(Int.random(in: 1...100)) // Replace age with score

            self.saveAndReload()
        }

        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
    }
        
       
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = items![indexPath.row]
        
        let alert = UIAlertController(title: "Update Person", message: "Change the name", preferredStyle: .alert)
        
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = person.playerName
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            person.playerName = textField.text
            
            self.saveAndReload()
        }
        
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let personToDelete = self.items![indexPath.row]
            
            self.context?.delete(personToDelete)
            
            self.saveAndReload()
            
        }
        
        delete.backgroundColor = UIColor.red
        let config = UISwipeActionsConfiguration(actions: [delete])
        
        return config
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        loadData()
    }

    lass HighLowViewController: UIViewController {
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var scoreLabel: UILabel!

        var score = 0
        var currentCardNumber = 0
        var previousCardNumber = 0

        @IBAction func touchHigh(_ sender: UIButton) {
            randomCard()
            score += (currentCardNumber > previousCardNumber) ? 1 : -1
            scoreLabel.text = "\(score)"
        }

        @IBAction func touchLow(_ sender: UIButton) {
            randomCard()
            score += (currentCardNumber < previousCardNumber) ? 1 : -1
            scoreLabel.text = "\(score)"
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            randomCard()
        }

        func randomCard() {
            previousCardNumber = currentCardNumber
            let suitNumber = Int.random(in: 1...4)
            currentCardNumber = Int.random(in: 1...13)
            imgView.image = UIImage(named: "card_\(suitNumber)_\(currentCardNumber)")
        }
    }

}

