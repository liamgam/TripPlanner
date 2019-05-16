//
//  AddWaypointsViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/28/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class AddWaypointsViewController: UIViewController {
    
    // MARK: - Variables
    var trip: Trip?
    var waypoints: NSMutableOrderedSet?
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addMoreButtonTapped(_ sender: UIButton) {
        if let mapVC = navigationController?.storyboard?.instantiateViewController(withIdentifier: "mapVC") as? MapViewController {
            mapVC.trip = trip
            navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        waypoints = trip?.waypoint
    }
}

extension AddWaypointsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if waypoints == nil {
            return 0
        } else {
            return waypoints!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "waypointCell") as! WaypointsTableViewCell
        if waypoints != nil {
            let waypoint = waypoints![indexPath.row] as! Waypoint
            cell.waypointLabel.text = waypoint.name
        }
        return cell
    }
    
}
