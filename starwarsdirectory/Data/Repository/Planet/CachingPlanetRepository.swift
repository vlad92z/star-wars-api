//
//  CachingPlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import os.log

class CachingPlanetRepository: PaginatedPlanetRepository {
    
    private let persistingRepository: PersistingPlanetRepository
    private let remoteRepository: PaginatedPlanetRepository
    
    init(persistingRepository: PersistingPlanetRepository, remoteRepository: PaginatedPlanetRepository) {
        self.persistingRepository = persistingRepository
        self.remoteRepository = remoteRepository
    }
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        let localPlanets = await persistingRepository.getPlanets(for: page)
        //TODO: Check for Stale data (e.g. update once per day)
        if !localPlanets.isEmpty {
            Logger.coredata.debug("Fetched local planets for page \(page)")
            return localPlanets
        }
        let remotePlanets = await remoteRepository.getPlanets(for: page)
        await persistingRepository.persist(planets: remotePlanets, for: page)
        return remotePlanets
    }
}
