//
//  ReviewCell.swift
//  api-client
//
//  Created by Jack Davis on 11/22/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(review: FoodTruckReview) {
        titleLabel.text = review.title
        reviewTextLabel.text = review.text
    }
}
