//
//  PlannedTripViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class PlannedTripViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func unwindToPlannedTrip(sender: UIStoryboardSegue) {
    }
    
    // MARK: - Variables
    var trips = ["Monterey", "Paris", "Tokyo", "San Francisco", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
    }
}

extension PlannedTripViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tripCell") as! TripTableViewCell
        cell.tripNameLabel.text = trips[indexPath.row]
        return cell
    }
}

