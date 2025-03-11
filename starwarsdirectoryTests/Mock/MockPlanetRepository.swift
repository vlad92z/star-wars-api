//
//  MockPlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
@testable import starwarsdirectory

class MockPlanetRepository: PersistingPlanetRepository {
    
    var planets: [Int: [PlanetResponse]] = [:]
    
    func persist(planets: [PlanetResponse], for page: Int) async {
        self.planets[page] = planets
    }
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        return planets[page] ?? []
    }
}
