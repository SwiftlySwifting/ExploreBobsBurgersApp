//
//  FavCharacterEnt+CoreDataProperties.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/10/23.
//
//

import Foundation
import CoreData


extension FavCharacterEnt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavCharacterEnt> {
        return NSFetchRequest<FavCharacterEnt>(entityName: "FavCharacterEnt")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var id: Int32

}

extension FavCharacterEnt : Identifiable {

}
