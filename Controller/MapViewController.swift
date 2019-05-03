//
//  MapViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBarTextField: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarTextField.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchPlaces(place: searchBarTextField.text!)
        
        searchBarTextField.endEditing(true)
    }
    
    func fetchPlaces(place: String) {
        
    }
}
