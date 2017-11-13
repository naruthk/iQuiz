//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/13/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Properties
    
    var questionIndex = 1
    var isCorrect = false
    var currentScore = 0
    var questions = [Question]()
    var userSelectedAnswer = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctIncorrectLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    
    @IBOutlet weak var btnProceedToEndPage: UIButton!
    @IBOutlet weak var btnProceedToNextQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = self.questions[questionIndex - 1].question
        
        if isCorrect {
            correctIncorrectLabel.text = "Hey, that's awesome. It's correct!"
        } else {
            correctIncorrectLabel.text = "Nice try, but your answer was wrong"
        }
        
        correctAnswerLabel.text = self.questions[questionIndex - 1].correctAnswer
        
        userAnswerLabel.text = userSelectedAnswer
        
        currentScoreLabel.text = "\(currentScore)"
        
        if (questionIndex < questions.count) {
            btnProceedToEndPage.isHidden = true
        }
        
        if (questionIndex > questions.count) {
            btnProceedToNextQuestion.isHidden = true
            btnProceedToEndPage.isHidden = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowNextQuestion" {
            let vc = segue.destination as! QuestionViewController
            vc.questions = self.questions
            vc.questionIndex = self.questionIndex + 1
            vc.currentScore = self.currentScore
        }
            
        if segue.identifier == "ShowEndGame" {
            let vc = segue.destination as! EndGameViewController
            vc.questions = self.questions
            vc.currentScore = self.currentScore
        }
        
    }

}
