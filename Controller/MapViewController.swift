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
    var trip: Trip?
    let locationManager = CLLocationManager()
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        setupSearch()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWayPoint))
        
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
    
    @objc func saveWayPoint() {
        
        let filter = mapView.annotations.last
        
        let waypoint = Waypoint(context: CoreDataHelper.managedObjectContext)
        waypoint.name = (filter?.title)!
        
        if let trip = trip {
            trip.addToWaypoint(waypoint)
            CoreDataHelper.saveContext()
        }
        
        // TODO: add to array of waypoint items in addWaypointsViewController
        // Check to dismiss and add to NewWayPointViewController or to instantiate NewWayPointViewController
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
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let viewRegion = MKCoordinateRegion(center: userLocation, span: span)
            mapView.setRegion(viewRegion, animated: true)
        }
       
    }
}


extension MapViewController: GMSAutocompleteResultsViewControllerDelegate /*GMSAutocompleteViewControllerDelegate*/ {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        // remove previous annotations
        mapView.removeAnnotations(mapView.annotations)
        
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
