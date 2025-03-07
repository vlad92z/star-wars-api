//
//  PersonResponse.swift
//  starwarsdirectory
//
//  Created by Vlad on 07/03/2025.
//
import Foundation

struct PersonResponse: Codable, Identifiable {
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
    
    var id: String {
        url
    }
}
