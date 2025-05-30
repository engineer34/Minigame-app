//
//  Person+CoreDataProperties.swift
//  TTT
//
//  Created by Feliciano Medina on 2/28/25.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}
