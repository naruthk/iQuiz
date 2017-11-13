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
        
        var message: String
        if (currentScore == questions.count) {
            message = "Wow! Impressive result you've earned."
        } else {
            message = "Better luck next time. Don't ever give up."
        }
        
        analyzeLabel.text = message
        scoreReportLabel.text = "\(currentScore) / \(questions.count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}

}
