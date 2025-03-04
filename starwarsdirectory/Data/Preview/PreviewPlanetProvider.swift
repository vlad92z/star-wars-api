//
//  PreviewPlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

class PreviewPlanetProvider: PlanetProviding {
    
    private var currentIndex = -1
    private var planetPages: [[Planet]] = [
        [
            Planet.preview(name: "Tatooine", url: "https://swapi.dev/api/planets/1/"),
            Planet.preview(name: "Alderaan", url: "https://swapi.dev/api/planets/2/"),
            Planet.preview(name: "Yavin IV", url: "https://swapi.dev/api/planets/3/")
        ],
        [
            Planet.preview(name: "Hoth", url: "https://swapi.dev/api/planets/4/")
        ],
        [
            Planet.preview(name: "Dagobah", url: "https://swapi.dev/api/planets/5/")
        ]
    ]
    
    var hasNext: Bool { currentIndex + 1 < planetPages.count }
    
    var hasPrevious: Bool {  currentIndex > 0 }
    
    func loadNext() async -> Result<[Planet], PlanetProviderError> {
        guard hasNext else { return .failure(.unavailable(message: "Last page reached")) }
        currentIndex += 1
        return .success(planetPages[currentIndex])
    }
    
    func loadPrevious() async -> Result<[Planet], PlanetProviderError> {
        guard hasPrevious else { return .failure(.unavailable(message: "Already on first page")) }
        currentIndex -= 1
        return .success(planetPages[currentIndex])
    }
}
