//
//  PreviewPlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

class PreviewPlanetProvider: PlanetProviding {
    var planets = [
        Planet.preview(name: "Tatooine", url: "https://swapi.dev/api/planets/1/"),
        Planet.preview(name: "Alderaan", url: "https://swapi.dev/api/planets/2/"),
        Planet.preview(name: "Yavin IV", url: "https://swapi.dev/api/planets/3/"),
        Planet.preview(name: "Hoth", url: "https://swapi.dev/api/planets/4/"),
        Planet.preview(name: "Dagobah", url: "https://swapi.dev/api/planets/5/")
    ]
}
