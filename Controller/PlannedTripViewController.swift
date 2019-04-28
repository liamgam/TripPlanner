//
//  PlannedTripViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit
import CoreData

class PlannedTripViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func unwindToPlannedTrip(sender: UIStoryboardSegue) {
    }
    
    // MARK: - Variables
    var allTrips = [Trip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        allTrips = CoreDataHelper.fectchAll()!
        
        NotificationCenter.default.addObserver(self, selector: #selector(addedTripItem(_:)), name: .didAddTripItem, object: nil)
    }
    
    @objc func addedTripItem(_ notification: Notification) {
        allTrips.append(notification.object as! Trip)
        
        tableview.beginUpdates()
        tableview.insertRows(at: [IndexPath(row: allTrips.count - 1, section: 0)], with: .automatic)
        tableview.endUpdates()
    }
}

extension PlannedTripViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTrips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tripCell") as! TripTableViewCell
        cell.tripNameLabel.text = allTrips[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let tripName = allTrips[indexPath.row].name {
            if let addWaypointsVC = navigationController?.storyboard?.instantiateViewController(withIdentifier: "addWaypointVC") as? AddWaypointsViewController, let newWaypointVC = navigationController?.storyboard?.instantiateViewController(withIdentifier: "newWaypointVC") as? NewWaypointViewController {
                
                let result = CoreDataHelper.fetchFirst(withName: tripName) as! Trip?
                if result!.waypoint?.count == 0 {
                    // navigate to NewWaypointViewController
                    navigationController?.pushViewController(newWaypointVC, animated: true)
                } else {
                    // navigate to AddWaypointViewController
                    navigationController?.pushViewController(addWaypointsVC, animated: true)
                }
                
            }
        }
        
    }
}
