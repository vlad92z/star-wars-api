//
//  PlanetListView.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import SwiftUI

struct PlanetListView: View {
    
    @Environment(\.personRepository) private var personRepository
    @StateObject var viewModel: ViewModel
    
    init(repository: PaginatedPlanetRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(repository: repository))
    }
    
    var body: some View {
        List {
            ForEach(viewModel.planets) { planet in
                NavigationLink(destination: {
                    PlanetDetailView(planet: planet, personRepository: personRepository)
                    }) {
                        Text(planet.name)
                    }
                
            }
            if viewModel.canLoadMore {
                ProgressView()
                    .id(viewModel.planets.count)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .task {
                        await viewModel.loadMore()
                    }
            }
        }
        .navigationTitle("Planets")
    }
}

#Preview {
    NavigationStack {
        PlanetListView(repository: PreviewPlanetRepository())
    }
}
