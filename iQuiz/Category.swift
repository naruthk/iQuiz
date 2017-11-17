//
//  Category.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/1/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class Category {
    
    // MARK: Properties
    var subject: String
    var description: String
    var icon: UIImage!
    var questionsArray: [Question]
    
    init (subject: String, description: String, icon: UIImage!, questionsArray: [Question]) {
        self.subject = subject
        self.description = description
        self.icon = icon
        self.questionsArray = questionsArray
    }
    
}
