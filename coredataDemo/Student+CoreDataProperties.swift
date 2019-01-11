//
//  Student+CoreDataProperties.swift
//  coredataDemo
//
//  Created by Harshil sureshbhai dobariya on 10/01/19.
//  Copyright © 2019 Harshil sureshbhai dobariya. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var spaciality: String?
    @NSManaged public var age: Int16

}
