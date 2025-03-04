//
//  ContentView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.planetProvider) private var planetProvider
    
    var body: some View {
        NavigationStack {
            PlanetListView(planetProvider: planetProvider)
        }
    }
}

#Preview {
    ContentView()
        .environment(\.planetProvider, PreviewPlanetProvider())
}
