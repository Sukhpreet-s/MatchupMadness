//
//  Security+CoreDataProperties.swift
//  MatchupMadness
//
//  Created by Joel Grenier on 2020-12-12.
//  Copyright © 2020 Swift Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Security {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Security> {
        return NSFetchRequest<Security>(entityName: "Security")
    }

    @NSManaged public var userId: Int16
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}
