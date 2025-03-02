//
//  PlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Combine

protocol PlanetProviding: ObservableObject {
    var planets: [Planet] { get }
}

class PlanetProvider: PlanetProviding {
    @Published var planets: [Planet] = []
}
