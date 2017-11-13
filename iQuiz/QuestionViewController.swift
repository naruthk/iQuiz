//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/12/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: Properties
    var questions : [Question]?
    var questionIndex = 0
    var answerIndex = 0
    var isCorrectAnswer = false
    var userSelectedAnswer = ""
    var currentScore = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = self.questions![questionIndex].question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AnswerTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AnswerTableViewCell
        if (answerIndex < questions!.count) {
            let answer = self.questions![questionIndex].answers[answerIndex]
            cell.answerLabel.text = answer
            answerIndex += 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelectedAnswer = self.questions![questionIndex].answers[indexPath.row]
        if userSelectedAnswer == self.questions![questionIndex].correctAnswer {
            self.isCorrectAnswer = true
        }
        print(userSelectedAnswer)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        if segue.identifier == "ShowResultForParticularQuestion" {
//
//            let destination = segue.destination as! UINavigationController
//            let vc = destination.topViewController as! ResultsViewController
        
//            if (self.isCorrectAnswer) {
//                vc.correct = true
//                currentScore =+ 1
//            }
//
//            vc.score = self.currentScore
//            vc.questions = self.questions
//            vc.userSelectedAnswer = self.userSelectedAnswer
//
//        }
    }

}
