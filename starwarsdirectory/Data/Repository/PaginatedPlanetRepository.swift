//
//  PaginatedPlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//

protocol PaginatedPlanetRepository {
    
    func getPlanets(for page: Int) async -> [PlanetResponse]
}
