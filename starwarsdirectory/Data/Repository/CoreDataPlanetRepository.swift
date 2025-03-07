//
//  PlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import Combine

class CoreDataPlanetRepository: PaginatedPlanetRepository {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        let request = PlanetEntity.fetch(page: page)
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.planetResponse }
        } catch {
            //TODO: Log error
            return []
        }
    }
    
    func persist(planets: [PlanetResponse], for page: Int) async {
        await PlanetEntity.persist(response: planets, for: page, in: context)
    }
}
