//
//  PersonEntity+PersonResponse.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
extension PersonEntity {
    
    var personResponse: PersonResponse {
        return PersonResponse(
            name: name,
            height: height,
            mass: mass,
            hairColor: hairColor,
            skinColor: skinColor,
            eyeColor: eyeColor,
            birthYear: birthYear,
            gender: gender,
            homeworld: homeworld,
            films: films,
            species: species,
            vehicles: vehicles,
            starships: starships,
            created: created,
            edited: edited,
            url: url
        )
    }
}
