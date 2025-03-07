//
//  PlanetEntity+Persistence.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData

extension PlanetEntity {
    
    static func persist(response: [PlanetResponse], for page: Int, in context: NSManagedObjectContext) async {
        do {
            try await context.perform {
                let editDate = DateFormatter.iso8601.string(from: Date())
                for planet in response {
                    process(response: planet, page: page, editDate: editDate, in: context)
                }
                try context.save()
            }
        } catch {
            //TODO: Log Error
        }
        
    }
}
