//
//  CoreDataHelper.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {

    static var managedObjectContext = AppDelegate().persistentContainer.viewContext
    
    class func fectchAll() -> [Trip]? {
        let request: NSFetchRequest<Trip> = Trip.fetchRequest()
        do {
            let results = try managedObjectContext.fetch(request)
            return results
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        return nil
    }

    class func saveContext() {
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print(error, error.userInfo)
        }
    }
}
