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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchPlaces(place: searchBarTextField.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarTextField.endEditing(true)
    }
    
    func fetchPlaces(place: String) {
        ServiceLayer.request(router: Router.fetchName(name: place))
    }
}
