//
//  PlanetEntity+Persistence.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import os.log

extension PersonEntity {
    
    static func persist(response: [PersonResponse], in context: NSManagedObjectContext) async {
        do {
            try await context.perform {
                let editDate = DateFormatter.iso8601.string(from: Date())
                for planet in response {
                    process(response: planet, editDate: editDate, in: context)
                }
                try context.save()
                Logger.coredata.debug("Persisted people in CoreData")
            }
        } catch {
            Logger.coredata.error("Failed to persist PersonResponse: \(error.localizedDescription)")
        }
        
    }
}
