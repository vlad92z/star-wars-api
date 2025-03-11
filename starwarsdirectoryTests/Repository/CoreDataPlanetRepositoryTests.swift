//
//  CoreDataPlanetRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct CoreDataPlanetRepositoryTests {
    
    let persistenceController = PersistenceController(inMemory: true)
    
    @Test("getPlanets returns planets from context for the expected page")
    func getPlanetsSucess() async throws {
        let context = persistenceController.container.viewContext
        let expectedPlanet1 = PlanetResponse.preview(name: "Test Planet", url: "www.planet.com/3")
        let expectedPlanet2 = PlanetResponse.preview(name: "Another Planet", url: "www.planet.com/4")
        let expectedEdit1 = "1"
        let expectedEdit2 = "2"
        PlanetEntity.process(
            response: expectedPlanet1,
            page: 1,
            editDate: expectedEdit1,
            in: context
        )
        PlanetEntity.process(
            response: expectedPlanet2,
            page: 2,
            editDate: expectedEdit2,
            in: context
        )
        try context.save()
        
        let planetRepository = CoreDataPlanetRepository(context: context)
        let planets = await planetRepository.getPlanets(for: 1)
        
        #expect(planets.count == 1)
        #expect(planets[0].url == expectedPlanet1.url)
        #expect(planets[0].url == expectedPlanet1.url)
        #expect(planets[0].edited == expectedEdit1)
    }
    
    @Test
    func persistPlanets() async throws {
        let context = persistenceController.container.viewContext
        let expectedPlanet1 = PlanetResponse.preview(name: "Test Planet", url: "www.planet.com/1")
        let expectedPlanet2 = PlanetResponse.preview(name: "Another Planet", url: "www.planet.com/2")
        let expectedEdit1 = "1"
        let expectedEdit2 = "2"
        let expetedPage = 3
        
        let planetRepository = CoreDataPlanetRepository(context: context)
        await planetRepository.persist(planets: [expectedPlanet1, expectedPlanet2], for: expetedPage)
        let planets = await planetRepository.getPlanets(for: expetedPage)
        
        #expect(planets.count == 2)
        #expect(planets[0].url == expectedPlanet1.url)
        #expect(planets[0].url == expectedPlanet1.url)
        #expect(planets[1].name == expectedPlanet2.name)
        #expect(planets[1].name == expectedPlanet2.name)
        #expect(planets[0].edited == planets[1].edited)
    }
}
