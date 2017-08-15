//
//  DBManager.swift
//  HitListCoreData
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import CoreData

class DBManager: NSObject {
    
    static let manager = DBManager()
    
    var context : NSManagedObjectContext{   // by this we make changes
        get{
            return persistentContainer.viewContext
        }
    }
    
    func fetchAllPeople(filter : String? = nil) -> NSFetchedResultsController<Person>{
        
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        let sortFirstName = NSSortDescriptor(key: "firstName", ascending: true)
        //let sortLastName = NSSortDescriptor(key: "lastName", ascending: true)
        let sortLastName = NSSortDescriptor(key: "lastName", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        
        request.sortDescriptors = [sortLastName, sortFirstName]
        
        if var filter = filter, !filter.isEmpty{
            filter = filter.trimmingCharacters(in:
                CharacterSet.whitespacesAndNewlines)    // remove spaces
            
            let predicate = NSPredicate(format: "firstName CONTAINS[cd] %@ OR lastName CONTAINS[cd] %@", filter, filter)
            request.predicate = predicate
        }
        
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.context, sectionNameKeyPath: "surnameInitial", cacheName: nil)
        try? controller.performFetch()
        return controller
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HitListCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    

}
