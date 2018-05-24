//
//  Item+CoreDataProperties.swift
//  toolkit_assignment_2
//
//  Created by AMIN HEYDARI on 10/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var qty: String?

}
