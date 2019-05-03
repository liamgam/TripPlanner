//
//  NewWaypointViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/28/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class NewWaypointViewController: UIViewController {

    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        // TODO: Instantiate to mapViewController
        if let mapVC = navigationController?.storyboard?.instantiateViewController(withIdentifier: "mapVC") as? MapViewController {
            navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
