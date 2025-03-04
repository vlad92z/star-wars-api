//
//  PlanetDetailView.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//
import SwiftUI

struct PlanetDetailView: View {
    
    let planet: Planet
    
    var body: some View {
        List {
            Section(header: Text("Details")) {
                DataView(title: "Rotation Period", data: String(planet.rotationPeriod))
                DataView(title: "Orbital Period", data: String(planet.orbitalPeriod))
                DataView(title: "Diameter", data: String(planet.diameter))
                DataView(title: "Climate", data: String(planet.climate))
                DataView(title: "Gravity", data: String(planet.gravity))
                DataView(title: "Terrrain", data: String(planet.terrain))
                DataView(title: "Surface Water", data: String(planet.surfaceWater))
                DataView(title: "Population", data: String(planet.population))
            }
        }
        .navigationTitle(planet.name)
    }
}

#Preview {
    NavigationStack {
        PlanetDetailView(planet: Planet.preview(name: "Tatooine", url: "123"))
    }
    
}
