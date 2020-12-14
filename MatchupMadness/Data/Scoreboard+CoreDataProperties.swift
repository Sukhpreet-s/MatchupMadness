//
//  Scoreboard+CoreDataProperties.swift
//  MatchupMadness
//
//  Created by Joel Grenier on 2020-12-12.
//  Copyright © 2020 Swift Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Scoreboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scoreboard> {
        return NSFetchRequest<Scoreboard>(entityName: "Scoreboard")
    }


    @NSManaged public var time: Int32

}
