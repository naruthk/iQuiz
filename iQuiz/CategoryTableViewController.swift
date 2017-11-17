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
        
        loadQuestionsData()
        
        // TO-DO: (See Ted's Slide)
        // 4) Add Settings (Slide 602)
    }
    
    // This method connects to an external web server to retrieve a JSON string object. This JSON string object
    // gets passed to a helper function that setups the necessary tables and cells and renders all
    // information (questions and answers) for the game.
    private func loadQuestionsData() {
        let json_url = "https://tednewardsandbox.site44.com/questions.json";
        var request = URLRequest(url: URL(string: json_url)!)
        request.httpMethod = "GET"
        
        // Performs a URLSession to execute an asynchronous call to retrieve data from
        // Ted's online Json file. Using .resume() to start callback.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                
                // When network connection fails, use the json string
                // aleady stored in the local storage system
                self.loadOfflineData()
            }
            do {
                let jsonObj = try JSONSerialization.jsonObject(with: data) as! Array<[String: Any]>
                self.parseJson(jsonObj)
                
                // Running DispatchQueue to "refresh" our questions/answers cells
                DispatchQueue.main.async { [unowned self] in
                    self.tableView.reloadData()
                }
                
                // Automatically saving to Local Storage in case next fetch of data is not successful
                let string = String(data: data, encoding: String.Encoding.utf8)
                UserDefaults.standard.set(string, forKey: "data")
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // Helper method that retrieves JSON data from a locally-stored database rather than from the Internet
    // server. Only runs when the Internet connection is offline
    private func loadOfflineData() {
        let string = UserDefaults.standard.object(forKey: "data") as! String!
        let jsonData = string?.data(using: .utf8)!
        let json = try! JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as! Array<[String: Any]>
        self.parseJson(json)
    }
    
    // Retrieves a JSON object (that has been serialized) and renders necessary table views and cells
    private func parseJson(_ jsonObj: Array<[String: Any]>) {
        for category in jsonObj {
            let subjectTitle = category["title"] as! String
            let description = category["desc"] as! String
            var questionsArray = [Question]()
            for question in category["questions"]  as! [AnyObject] {
                let questionTitle = question["text"] as! String
                var answersArray = [String]()
                let correctAnswerIndex = question["answer"] as! String
                let answersChoices = question["answers"] as! [AnyObject]
                for answer in answersChoices {
                    answersArray.append(answer as! String)
                }
                questionsArray.append(Question(question: questionTitle, answers: answersArray, correctAnswer: answersArray[Int(correctAnswerIndex)! - 1]))
            }
            
            // An image named "Blank" will be used if the questions' subjects are not either Mathematics,
            // Science, or Marvel Super Heroes.
            var image: UIImage
            if subjectTitle == "Mathematics" {
                image = UIImage(named: "Math")!
            } else if subjectTitle == "Science!" {
                image = UIImage(named: "Science")!
            } else if subjectTitle == "Marvel Super Heroes" {
                image = UIImage(named: "Marvel")!
            } else {
                image = UIImage(named: "Blank")!
            }
            let category = Category(subject: subjectTitle, description: description, icon: image, questionsArray: questionsArray)
            self.categories.append(category)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

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
