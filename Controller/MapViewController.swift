//
//  MapViewController.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

class MapViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Variables
    let locationManager = CLLocationManager()
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        setupSearch()
    }
    
    func setupSearch() {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let searchbar = searchController?.searchBar
        searchbar?.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.modalPresentationStyle = .popover
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // set up location manager
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAuthorization()
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            setUserLocationRegion()
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
    
    func setUserLocationRegion() {
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(viewRegion, animated: true)
        }
       
    }
}


extension MapViewController: GMSAutocompleteResultsViewControllerDelegate /*GMSAutocompleteViewControllerDelegate*/ {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        // TODO: show annotation of selected place on map view
        let annotation = MKPointAnnotation()
        annotation.title = place.name
        annotation.coordinate = place.coordinate
        
        mapView.addAnnotation(annotation)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
