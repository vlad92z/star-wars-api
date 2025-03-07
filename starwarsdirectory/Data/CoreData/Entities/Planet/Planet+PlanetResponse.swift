//
//  Planet+PlanetResponse.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
extension PlanetEntity {
    
    var planetResponse: PlanetResponse {
        return PlanetResponse(
            url: url,
            name: name,
            rotationPeriod: rotationPeriod,
            orbitalPeriod: orbitalPeriod,
            diameter: diameter,
            climate: climate,
            gravity: gravity,
            terrain: terrain,
            surfaceWater: surfaceWater,
            population: population,
            residents: residents,
            films: films,
            created: created,
            edited: edited
        )
    }
}
