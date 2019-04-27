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
    var managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    // MARK: - Outlets
    @IBOutlet weak var tripNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedContext = AppDelegate.context
    }
    
    // MARK: - Actions
    @IBAction func addNewTripButtonTapped(_ sender: UIBarButtonItem) {

        // create new trip object
        let trip = Trip(context: managedContext)
        trip.name = tripNameTextField.text
        
        // save name to new object
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("error: \(error), decription: \(error.userInfo)")
        }
        
        performSegue(withIdentifier: "plannedTripViewController", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tripNameTextField.endEditing(true)
    }
}
