//
//  PlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import Combine
import os.log

protocol PersistingPlanetRepository: PaginatedPlanetRepository {
    func persist(planets: [PlanetResponse], for page: Int) async
}

class CoreDataPlanetRepository: PersistingPlanetRepository {
    
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
            Logger.coredata.error("Failed to fetch planets: \(error.localizedDescription)")
            return []
        }
    }
    
    func persist(planets: [PlanetResponse], for page: Int) async {
        await PlanetEntity.persist(response: planets, for: page, in: context)
    }
}
