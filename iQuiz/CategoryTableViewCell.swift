//
//  CategoryTableViewCell.swift
//  iQuiz
//
//  Created by Naruth Kongurai on 11/1/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var questions: [Question] = []
    
//    init (categoryContent: Category) {
//        self.categoryContent = categoryContent
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
