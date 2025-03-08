//
//  PlanetEntity+Persistence.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import os.log

extension PlanetEntity {
    
    static func persist(response: [PlanetResponse], for page: Int, in context: NSManagedObjectContext) async {
        do {
            try await context.perform {
                let editDate = DateFormatter.iso8601.string(from: Date())
                for planet in response {
                    process(response: planet, page: page, editDate: editDate, in: context)
                }
                try context.save()
                Logger.coredata.debug("Persisted planets in CoreData for page: \(page)")
            }
        } catch {
            Logger.coredata.error("Failed to persist planets: \(error.localizedDescription)")
        }
        
    }
}
