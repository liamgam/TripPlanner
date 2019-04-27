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
    var managedContext = NSManagedObjectContext()

    // MARK: - Outlets
    @IBOutlet weak var tripNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedContext = AppDelegate.context
    }
    
    // MARK: - Actions
    @IBAction func addNewTripButtonTapped(_ sender: UIBarButtonItem) {
        // TODO: add item to core data in the Trip entity
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tripNameTextField.endEditing(true)
    }
}
