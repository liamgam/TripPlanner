//
//  Waypoint+CoreDataProperties.swift
//  TripPlanner
//
//  Created by Rinni Swift on 4/26/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//
//

import Foundation
import CoreData


extension Waypoint {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waypoint> {
        return NSFetchRequest<Waypoint>(entityName: "Waypoint")
    }

    @NSManaged public var name: String?
    @NSManaged public var trip: Trip?

}
