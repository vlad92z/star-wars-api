//
//  StarWarsDirectoryApp.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

@main
struct StarWarsDirectoryApp: App {
    
    private let planetProvider: any PlanetProviding = PlanetProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.planetProvider, planetProvider)
        }
    }
}
