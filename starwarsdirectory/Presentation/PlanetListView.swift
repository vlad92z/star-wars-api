//
//  PlanetListView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import SwiftUI

struct PlanetListView: View {
    
    @Environment(\.planetProvider) var planetProvider
    
    var body: some View {
        List {
            ForEach(planetProvider.planets) { planet in
                Text(planet.name)
            }
        }.navigationTitle("Planets")
    }
}

#Preview {
    PlanetListView().environment(\.planetProvider, PreviewPlanetProvider())
}
