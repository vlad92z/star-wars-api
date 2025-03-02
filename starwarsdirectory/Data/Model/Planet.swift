//
//  Planet.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Foundation

struct Planet: Codable, Identifiable {
    
    let url: String
    let name: String
    let rotationPeriod: Int
    let orbitalPeriod: Int
    let diameter: Int
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: Int
    let population: Int
    let residents: [String]
    let films: [String]
    let created: Date
    let edited: Date
    
    var id: String {
        url
    }
}
