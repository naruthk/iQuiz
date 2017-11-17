//
//  EndGameViewController.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/13/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    // MARK: Properties
    var currentScore = 0
    var questions = [Question]()
    @IBOutlet weak var analyzeLabel: UILabel!
    @IBOutlet weak var scoreReportLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scoreReportLabel.text = "\(currentScore) / \(questions.count)"
        let isCorrect = currentScore == questions.count
        let message: String = isCorrect ?
            "Now that's incredible! Great job!" : "Better luck next time. Don't ever give up."
        analyzeLabel.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
