//
//  ContentView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.planetRepository) private var planetRepository
    
    var body: some View {
        NavigationStack {
            PlanetListView(repository: planetRepository)
        }
    }
}

#Preview {
    ContentView()
        .environment(\.planetRepository, PreviewPlanetRepository())
}
