//
//  CachingPlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import os.log

class CachingPlanetRepository: PaginatedPlanetRepository {
    
    private let coreDataRepository: CoreDataPlanetRepository
    private let remoteRepository: RemotePlanetRepository
    
    init(coreDataRepository: CoreDataPlanetRepository, remoteRepository: RemotePlanetRepository) {
        self.coreDataRepository = coreDataRepository
        self.remoteRepository = remoteRepository
    }
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        let localPlanets = await coreDataRepository.getPlanets(for: page)
        //TODO: Check for Stale data (e.g. update once per day)
        if !localPlanets.isEmpty {
            Logger.coredata.debug("Fetched local planets for page \(page)")
            return localPlanets
        }
        let remotePlanets = await remoteRepository.getPlanets(for: page)
        await coreDataRepository.persist(planets: remotePlanets, for: page)
        return remotePlanets
    }
}
