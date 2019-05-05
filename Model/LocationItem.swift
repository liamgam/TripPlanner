//
//  LocationItem.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation

struct Results: Codable {
    
    let results: [LocationInfo]
    
}

struct LocationInfo: Codable {

    let name: String
    let geometry: Location

}

struct Location: Codable {
    
    let location: LatLong
    
}

struct LatLong: Codable {
    
    let lat: Double
    let lng: Double
    
}
