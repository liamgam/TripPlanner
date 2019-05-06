//
//  MapViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBarTextField: UISearchBar!
    
    // MARK: - Variables
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarTextField.delegate = self
        checkLocationServices()
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // set up location manager
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            checkLocationAuthorization()
        } else {
            // doesnt display current location on map
            print("location not enabled")
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError("introduced new CLLocationManager status case but not handled in switch statement")
        }
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchPlaces(place: searchBarTextField.text!)
        searchBarTextField.endEditing(true)
    }
    
    func fetchPlaces(place: String) {
        ServiceLayer.request(router: Router.fetchName(name: place)) { (result: Results) in
            // TODO: update annotation on the mapView
            print(result.results[0].name)
        }
    }
}
