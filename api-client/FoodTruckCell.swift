//
//  FoodTruckCell.swift
//  api-client
//
//  Created by Jack Davis on 11/21/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class FoodTruckCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var avgCostLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(truck: FoodTruck) {
        nameLabel.text = truck.name
        foodTypeLabel.text = truck.foodType
        avgCostLabel.text = "$\(truck.avgCost)"
    }
}
