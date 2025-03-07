//
//  PlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//

protocol PlanetProviding {
    
    var hasNext: Bool { get }
    var hasPrevious: Bool { get }
    
    func loadNext() async -> [PlanetResponse]
    func loadPrevious() async -> [PlanetResponse]
}

class PlanetProvider: PlanetProviding {
    
    private(set) var currentPage = 0
    
    private let repository: PaginatedPlanetRepository
    
    init(repository: PaginatedPlanetRepository) {
        self.repository = repository
    }
    
    var hasNext: Bool { true }
    var hasPrevious: Bool { currentPage > 2 }
    
    func loadNext() async -> [PlanetResponse] {
        currentPage += 1
        return await repository.getPlanets(for: currentPage)
    }
    
    func loadPrevious() async -> [PlanetResponse] {
        guard hasPrevious else { return [] }
        currentPage -= 1
        return await repository.getPlanets(for: currentPage)
    }
}
