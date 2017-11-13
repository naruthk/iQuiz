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
    
    var questionIndex = 0
    var isCorrect = false
    var currentScore = 0
    var questions = [Question]()
    var userSelectedAnswer = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctIncorrectLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = self.questions[questionIndex].question
        
        if isCorrect {
            correctIncorrectLabel.text = "CORRECT !"
        } else {
            correctIncorrectLabel.text = "INCORRECT !"
        }
        
        correctAnswerLabel.text = self.questions[questionIndex].correctAnswer
        
        userAnswerLabel.text = userSelectedAnswer
        
        currentScoreLabel.text = "\(currentScore)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
