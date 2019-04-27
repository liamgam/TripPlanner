//
//  AddTripViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit
import CoreData

class AddTripViewController: UIViewController {
    
    // MARK: - Variables
    let coreDataHelper = CoreDataHelper()

    // MARK: - Outlets
    @IBOutlet weak var tripNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func addNewTripButtonTapped(_ sender: UIBarButtonItem) {

        // create new trip object and save to core data
        let trip = Trip(context: coreDataHelper.managedObjectContext)
        trip.name = tripNameTextField.text
        coreDataHelper.saveContext()
        
        performSegue(withIdentifier: "plannedTripViewController", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tripNameTextField.endEditing(true)
    }
}
