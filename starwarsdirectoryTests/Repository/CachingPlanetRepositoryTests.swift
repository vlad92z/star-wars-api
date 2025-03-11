//
//  CachingPlanetRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct CachingPlanetRepositoryTests {
    
    let localRepository = MockPlanetRepository()
    let remoteRepository = MockPlanetRepository()
    
    @Test("getPlanets returns result from persistingRepository first")
    func getPlanetsFromLocal() async {
        let expectedPage = 1
        let localIds = ["ww1.local.com", "ww2.local.com"]
        let remoteIds = ["ww1.remote.com", "ww2.remote.com"]
        let localPlanets = [
            PlanetResponse.preview(name: "local1", url: localIds[0]),
            PlanetResponse.preview(name: "local2", url: localIds[1])
        ]
        let remotePlanets = [
            PlanetResponse.preview(name: "remote1", url: remoteIds[0]),
            PlanetResponse.preview(name: "remote2", url: remoteIds[1])
        ]
        localRepository.planets[expectedPage] = localPlanets
        remoteRepository.planets[expectedPage] = remotePlanets
        let cachingRepository = CachingPlanetRepository(
            persistingRepository: localRepository,
            remoteRepository: remoteRepository
        )
        let cachedPlanets = await cachingRepository.getPlanets(for: expectedPage)
        #expect(cachedPlanets.count == localIds.count)
        #expect(cachedPlanets[0].id == localIds[0])
        #expect(cachedPlanets[1].id == localIds[1])
    }
    
    @Test("getPlanets returns result from remoteRepository and persists the result")
    func getPlanetsFromRemote() async {
        let expectedPage = 1
        let remoteIds = ["ww1.remote.com", "ww2.remote.com"]
        let remotePlanets = [
            PlanetResponse.preview(name: "remote1", url: remoteIds[0]),
            PlanetResponse.preview(name: "remote2", url: remoteIds[1])
        ]
        remoteRepository.planets[expectedPage] = remotePlanets
        let cachingRepository = CachingPlanetRepository(
            persistingRepository: localRepository,
            remoteRepository: remoteRepository
        )
        let cachedPlanets = await cachingRepository.getPlanets(for: expectedPage)
        #expect(cachedPlanets.count == remoteIds.count)
        #expect(cachedPlanets[0].id == remoteIds[0])
        #expect(cachedPlanets[1].id == remoteIds[1])
        
        let persistedPlanets = localRepository.planets[expectedPage] ?? []
        #expect(persistedPlanets.count == remoteIds.count)
        #expect(persistedPlanets[0].id == remoteIds[0])
        #expect(persistedPlanets[1].id == remoteIds[1])
    }
}
