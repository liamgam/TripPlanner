//
//  ServiceLayer.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation

class ServiceLayer {
    
    class func request(router: Router) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else {
            print("failed url")
            return
        }
        
        print(url)
        var urlRequest = URLRequest(url: url)
        print(urlRequest)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                print("error")
                return
            }
            guard data != nil else {
                print("empty data")
                return
            }
            guard response != nil else {
                print("empty response")
                return
            }
            
            print(response)
        }
        dataTask.resume()
    }
}
