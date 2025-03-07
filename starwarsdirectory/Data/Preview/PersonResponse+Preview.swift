//
//  PersonResponse+Preview.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Foundation

extension PersonResponse {
    
    static func preview(name: String, url: String) -> PersonResponse {
        return PersonResponse(
            name: name,
            height: "172",
            mass: "77",
            hairColor: "blond",
            skinColor: "fair",
            eyeColor: "blue",
            birthYear: "19BBY",
            gender: "male",
            homeworld: "https://swapi.dev/api/planets/1/",
            films: [
                "https://swapi.dev/api/films/1/",
                "https://swapi.dev/api/films/2/",
                "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/6/"
            ],
            species: [],
            vehicles: [
                "https://swapi.dev/api/vehicles/14/",
                "https://swapi.dev/api/vehicles/30/"
            ],
            starships: [
                "https://swapi.dev/api/starships/12/",
                "https://swapi.dev/api/starships/22/"
            ],
            created: "2014-12-09T13:50:51.644000Z",
            edited: "2014-12-20T21:17:56.891000Z",
            url: url
        )
    }
}
