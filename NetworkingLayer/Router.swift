//
//  Router.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation

enum Router {
    case fetchName(name: String)

    var scheme: String {
        switch self {
        case .fetchName(let name):
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .fetchName(let name):
            return "maps.googleapis.com"
        }
    }
    
    var path: String {
        switch self {
        case .fetchName(let name):
            return "/maps/api/place/textsearch/json"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .fetchName(let name):
            return [URLQueryItem(name: "query", value: name),
                    URLQueryItem(name: "key", value: GOOGLE_API_KEY)]
        }
    }
}
