//
//  PersistenceService.swift
//  coredataDemo
//
//  Created by Harshil sureshbhai dobariya on 10/01/19.
//  Copyright © 2019 Harshil sureshbhai dobariya. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService{

    // MARK: - Core Data stack
    private init(){
        
    }
    static var context : NSManagedObjectContext{
        return PersistenceService.persistentContainer.viewContext
    }
    
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "coredataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("SAVED")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
