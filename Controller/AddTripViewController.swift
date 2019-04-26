//
//  AddTripViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tripNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addNewTripButtonTapped(_ sender: UIBarButtonItem) {
        print(tripNameTextField.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tripNameTextField.endEditing(true)
    }
}
