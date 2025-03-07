//
//  PlanetEntity+Update.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData

extension PlanetEntity {
    
    static func process(response: PlanetResponse, page: Int, editDate: String, in context: NSManagedObjectContext) {
        let fetchRequest = PlanetEntity.fetch(url: response.url)
        fetchRequest.fetchLimit = 1
        do {
            let planet: PlanetEntity
            if let fetched = try context.fetch(fetchRequest).first {
                planet = fetched
            } else {
                guard let description = entityDescription(in: context) else {
                    // TODO: Log error
                    return
                }
                planet = PlanetEntity(entity: description, insertInto: context)
            }
            planet.edited = editDate
            planet.update(with: response)
            planet.page = Int16(page)
            
        } catch {
            // TODO: Log error
        }
    }
    
    func update(with response: PlanetResponse) {
        self.url = response.url
        self.name = response.name
        self.rotationPeriod = response.rotationPeriod
        self.orbitalPeriod = response.orbitalPeriod
        self.diameter = response.diameter
        self.climate = response.climate
        self.gravity = response.gravity
        self.terrain = response.terrain
        self.surfaceWater = response.surfaceWater
        self.population = response.population
        self.residents = response.residents
        self.films = response.films
        self.created = response.created
    }
}
