//
//  ContentView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            PlanetListView()
        }
    }
}

#Preview {
    ContentView()
        .environment(\.planetProvider, PreviewPlanetProvider())
}
