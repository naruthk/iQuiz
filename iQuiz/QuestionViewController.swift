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
    var questionIndex = 1
    var answerIndex = 0
    var isCorrectAnswer = false
    var userSelectedAnswer = ""
    var currentScore = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = self.questions![questionIndex - 1].question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let answers_amount = self.questions![questionIndex - 1].answers.count
        return answers_amount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AnswerTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AnswerTableViewCell
        let answers_amount = self.questions![questionIndex - 1].answers.count
        if (answerIndex <= answers_amount) {
            let answer = self.questions![questionIndex - 1].answers[answerIndex]
            cell.answerLabel.text = answer
            answerIndex += 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelectedAnswer = self.questions![questionIndex - 1].answers[indexPath.row]
        let correctAnswer = self.questions![questionIndex - 1].correctAnswer
        if userSelectedAnswer == correctAnswer {
            self.isCorrectAnswer = true
        } else {
            self.isCorrectAnswer = false
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowResult" {
            let vc = segue.destination as! ResultViewController
            if (self.isCorrectAnswer) {
                vc.isCorrect = true
                currentScore += 1
            }
            vc.questionIndex = self.questionIndex
            vc.currentScore = self.currentScore
            vc.questions = self.questions!
            vc.userSelectedAnswer = self.userSelectedAnswer

        }
        
    }
    

}
