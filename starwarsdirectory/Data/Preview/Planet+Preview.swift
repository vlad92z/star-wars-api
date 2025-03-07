//
//  Planet+Preview.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Foundation

extension PlanetResponse {
    
    static func preview(name: String, url: String) -> PlanetResponse {
        return PlanetResponse(
            url: url,
            name: name,
            rotationPeriod: "23",
            orbitalPeriod: "304",
            diameter: "10465",
            climate: "arid",
            gravity: "1 standard",
            terrain: "desert",
            surfaceWater: "1",
            population: "200000",
            residents: [
                "https://swapi.dev/api/people/1/",
                "https://swapi.dev/api/people/2/",
                "https://swapi.dev/api/people/4/",
                "https://swapi.dev/api/people/6/",
                "https://swapi.dev/api/people/7/",
                "https://swapi.dev/api/people/8/",
                "https://swapi.dev/api/people/9/",
                "https://swapi.dev/api/people/11/",
                "https://swapi.dev/api/people/43/",
                "https://swapi.dev/api/people/62/"
            ],
            films: [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/4/",
                "https://swapi.dev/api/films/5/",
                "https://swapi.dev/api/films/6/"
            ],
            created: "2014-12-09T13:50:49.641000Z",
            edited: "2014-12-09T13:50:49.641000Z"
        )
    }
}
