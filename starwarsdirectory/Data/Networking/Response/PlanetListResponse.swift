//
//  PlanetListResponse.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
struct PlanetListResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}
