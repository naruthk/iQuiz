//
//  CategoryTableViewController.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/1/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    // MARK: Properties
    var categories = [Category]()
    
    let mathQuestions = [
        Question(
            question: "At a party, everyone shook hands with everybody else. There were 66 handshakes. How many people were at the party?",
            answers: ["30", "14", "12", "25"],
            correctAnswer: "12"
        ),
        Question(
            question: "It's dark. You have ten grey socks and ten blue socks you want to put into pairs. All socks are exactly the same except for their colour. How many socks would you need to take with you to ensure you had at least a pair?",
            answers: ["3", "6", "18", "7"],
            correctAnswer: "3"
        ),
        Question(
            question: "My grandson is about as many days as my daugher in weeks, and my grandson is as many months as I am in years. My grandson, my daughter and I together are 120 years. Can you tell me my age in years ?",
            answers: ["60", "72", "66", "81"],
            correctAnswer: "72"
        ),
        Question(
            question: "If 9999 = 4, 8888 = 8, 1816 = 6, 1212 = 0, then 1919 = ?",
            answers: ["10", "4", "2", "12"],
            correctAnswer: "4"
        )
    ]
    
    let scienceQuestions = [
        Question(
            question: "The image formed in a compound microscope is",
            answers: ["erect", "inverted", "sometimes erect, sometimes inverted", "none"],
            correctAnswer: "inverted"
        ),
        Question(
            question: "The elimination of toxic nitrogenous waste and excess water in man is by",
            answers: ["Excretion", "Circulation", "Reproduction", "Pollution"],
            correctAnswer: "Excretion"
        ),
        Question(
            question: "Which colour of light is deviated least",
            answers: ["Red", "Blue", "Violet", "Green"],
            correctAnswer: "Red"
        ),
        Question(
            question: "Which blood cells are called 'Soldiers' of the body?",
            answers: ["WBC", "Platelets", "RBC", "All of the above"],
            correctAnswer: "WBC"
        )
    ]
    
    let marvelQuestions = [
        Question(
            question: "The Infinity Gauntlet holds how many gems?",
            answers: ["5", "6", "7", "8"],
            correctAnswer: "6"
        ),
        Question(
            question: "What is the code name of the Super Soldier project that creates Captain America?",
            answers: ["Project Victory", "Project Patriot", "Project Rebirth", "Project Revival"],
            correctAnswer: "Project Rebirth"
        ),
        Question(
            question: "Who became the second version of Ant-man by stealing the technology from Dr. Hank Pym?",
            answers: ["Eric O'Grady", "Darren Cross", "Scott Lang", "Mitchell Carson"],
            correctAnswer: "Scott Lang"
        ),
        Question(
            question: "What villain shot Captain America from a sniper's position as the Captain was leaving a federal courthouse after the events of the Civil War?",
            answers: ["Bullseye", "Crossbones", "Deathlok", "Hulk"],
            correctAnswer: "Crossbones"
        )
    ]
    
    // MARK: Actions
    @IBAction func settingsButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Alert", message: "Settings go here!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
                                        NSLog("\"OK\" pressed.")
        }))
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleCategories()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func loadSampleCategories() {
        
        categories.append(Category(subject: "Mathematics", description: "Test your knowledge on math!", icon: UIImage(named: "Math")!, questionsArray: mathQuestions))
        categories.append(Category(subject: "Marvel Super Heroes", description: "Test your knowledge on characters in the Marvel Universe!", icon: UIImage(named: "Marvel")!, questionsArray: scienceQuestions))
        categories.append(Category(subject: "Science", description: "Test how well you think you know science!", icon: UIImage(named: "Science")!, questionsArray: marvelQuestions))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CategoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CategoryTableViewCell.")
        }
        
        let category = categories[indexPath.row]
        
        cell.subjectLabel.text = category.subject
        cell.descriptionLabel.text = category.description
        cell.imageView?.image = category.icon
        cell.questions = category.questionsArray
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowQuestion" {
            
            let cell = sender as! CategoryTableViewCell
            let questions = cell.questions
            
            let destination = segue.destination as! UINavigationController
            let vc = destination.topViewController as! QuestionViewController
            vc.questions = questions
            
        }
        
    }

}
