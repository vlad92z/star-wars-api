//
//  PreviewPlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

class PreviewPlanetProvider: PlanetProviding {
    
    private var currentIndex = -1
    private var planetPages: [[PlanetResponse]] = [
        [
            PlanetResponse.preview(name: "Tatooine", url: "https://swapi.dev/api/planets/1/"),
            PlanetResponse.preview(name: "Alderaan", url: "https://swapi.dev/api/planets/2/"),
            PlanetResponse.preview(name: "Yavin IV", url: "https://swapi.dev/api/planets/3/")
        ],
        [
            PlanetResponse.preview(name: "Hoth", url: "https://swapi.dev/api/planets/4/")
        ],
        [
            PlanetResponse.preview(name: "Dagobah", url: "https://swapi.dev/api/planets/5/")
        ]
    ]
    
    var hasNext: Bool { currentIndex + 1 < planetPages.count }
    
    var hasPrevious: Bool {  currentIndex > 0 }
    
    func loadNext() async -> [PlanetResponse] {
        guard hasNext else { return [] }
        currentIndex += 1
        return planetPages[currentIndex]
    }
    
    func loadPrevious() async -> [PlanetResponse] {
        guard hasPrevious else { return [] }
        currentIndex -= 1
        return planetPages[currentIndex]
    }
}
