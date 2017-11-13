//
//  Questions.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/12/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import Foundation

class Question {
    
    var question : String
    var answers : [String]
    var correctAnswer : String
    
    init (question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
}
