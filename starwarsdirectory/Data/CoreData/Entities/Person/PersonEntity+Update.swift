//
//  PersonEntity+Update.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import os.log

extension PersonEntity {
    
    static func process(response: PersonResponse, editDate: String, in context: NSManagedObjectContext) {
        let fetchRequest = PersonEntity.fetch(url: response.url)
        fetchRequest.fetchLimit = 1
        do {
            let person: PersonEntity
            if let fetched = try context.fetch(fetchRequest).first {
                person = fetched
            } else {
                guard let description = entityDescription(in: context) else {
                    Logger.coredata.error("Entity description nil for PersonEntity")
                    return
                }
                person = PersonEntity(entity: description, insertInto: context)
            }
            person.edited = editDate
            person.update(with: response)
        } catch {
            Logger.coredata.error("Failed to fetch people: \(error.localizedDescription)")
        }
    }
    
    func update(with response: PersonResponse) {
        self.name = response.name
        self.height = response.height
        self.mass = response.mass
        self.hairColor = response.hairColor
        self.skinColor = response.skinColor
        self.eyeColor = response.eyeColor
        self.birthYear = response.birthYear
        self.gender = response.gender
        self.homeworld = response.homeworld
        self.films = response.films
        self.species = response.species
        self.vehicles = response.vehicles
        self.starships = response.starships
        self.created = response.created
        self.url = response.url
    }
}
