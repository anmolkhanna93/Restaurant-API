//
//  ReviewsVC.swift
//  api-client
//
//  Created by Jack Davis on 11/22/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {
    
    var selectedFoodTruck: FoodTruck?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        DataService.instance.delegate = self
        
        if let truck = selectedFoodTruck {
            nameLabel.text = truck.name
            DataService.instance.getAllReviews(for: truck)
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
}

extension ReviewsVC: DataServiceDelegate {
    func trucksLoaded() {
        
    }
    
    func reviewsLoaded() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
}

extension ReviewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell {
            cell.configureCell(review: DataService.instance.reviews[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}