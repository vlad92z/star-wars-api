//
//  Planet.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Foundation

struct PlanetResponse: Codable, Identifiable {
    
    let url: String
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    
    var id: String {
        url
    }
}
