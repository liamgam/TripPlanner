//
//  ServiceLayer.swift
//  TripPlanner
//
//  Created by Rinni Swift on 5/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation

class ServiceLayer {
    
    class func request<T: Codable>(router: Router, completion: @escaping (T) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else {
            print("failed url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                print("error")
                return
            }
            guard let data = data else {
                print("empty data")
                return
            }
            guard response != nil else {
                print("empty response")
                return
            }
            
            do {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(responseObject)
                }
            } catch {
                print("error")
            }
        }
        dataTask.resume()
    }
}
