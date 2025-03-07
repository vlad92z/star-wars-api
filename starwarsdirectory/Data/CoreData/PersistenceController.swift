//
//  PersistenceController.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import Foundation
import CoreData
import os.log

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        
        self.container = NSPersistentContainer(name: "starwars")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Error loading container: \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    @MainActor
    func save(maybeContext: NSManagedObjectContext? = nil) {
        let context = maybeContext ?? container.viewContext
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            //TODO: Add Logging
        }
    }
}

