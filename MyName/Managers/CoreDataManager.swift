//
//  CoreDataManager.swift
//  MyName
//
//  Created by Danielle Smith on 10/13/23.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "nameMeaning")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext () {
        let context = CoreDataManager().persistentContainer.viewContext
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
    //Create a function that retrieves the first name meaning/history and places it in the first scroll box.
    
    func fetchMatchingNames(with names: [String]) -> [String] {
        
        var defArray: [String] = []
        
        let fetchRequest: NSFetchRequest<Name> = Name.fetchRequest()
        
        for name in names {
            fetchRequest.predicate = NSPredicate(format: "%K == %@", argumentArray: ["title", name])
            
            do {
                let nameMatch = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
                guard let nameTitle = nameMatch.first?.title,
                      let nameMeaning = nameMatch.first?.meaning
                else {
                    defArray.append(name + ": A mystery to discover. Perhaps check your family history!")
                    continue
                }
                defArray.append("\(nameTitle): \(nameMeaning)")
            } catch let error {
                print("oops! an error occured while fetching \(name). \(error)")
                defArray.append(name + ": A mystery to discover. Perhaps check your family history!")
            }
        }
        return defArray
    }
}
