//
//  AnswerTableViewCell.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/12/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
