//
//  PreviewPlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

class PreviewPlanetRepository: PaginatedPlanetRepository {
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
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        let index = page - 1
        let pageExists = planetPages.count > index
        return pageExists ? planetPages[page] : []
    }
}
