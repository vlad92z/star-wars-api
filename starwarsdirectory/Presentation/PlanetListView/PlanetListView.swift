//
//  PlanetListView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import SwiftUI

struct PlanetListView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(planetProvider: PlanetProviding) {
        _viewModel = StateObject(wrappedValue: ViewModel(planetProvider: planetProvider))
    }
    
    var body: some View {
        List {
            ForEach(viewModel.planets) { planet in
                Text(planet.name)
            }
        }
        .navigationTitle("Planets")
        .task {
            await viewModel.loadMore()
        }
    }
}

#Preview {
    PlanetListView(planetProvider: PreviewPlanetProvider())
}
