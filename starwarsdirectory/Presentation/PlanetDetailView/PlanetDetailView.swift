//
//  PlanetDetailView.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//
import SwiftUI

struct PlanetDetailView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(planet: PlanetResponse, personRepository: PersonRepository) {
        _viewModel = StateObject(wrappedValue: ViewModel(personRepository: personRepository, planet: planet))
    }
    
    var body: some View {
        List {
            Section(header: Text("Details")) {
                DataView(title: "Rotation Period", data: String(viewModel.planet.rotationPeriod))
                DataView(title: "Orbital Period", data: String(viewModel.planet.orbitalPeriod))
                DataView(title: "Diameter", data: String(viewModel.planet.diameter))
                DataView(title: "Climate", data: String(viewModel.planet.climate))
                DataView(title: "Gravity", data: String(viewModel.planet.gravity))
                DataView(title: "Terrrain", data: String(viewModel.planet.terrain))
                DataView(title: "Surface Water", data: String(viewModel.planet.surfaceWater))
                DataView(title: "Population", data: String(viewModel.planet.population))
            }
            Section(header: Text("Residents")) {
                ForEach(viewModel.residents) { resident in
                    Text(resident.name)
                }
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle(viewModel.planet.name)
        .task {
            await viewModel.updateResidents()
        }
    }
}

#Preview {
    NavigationStack {
        PlanetDetailView(
            planet: PlanetResponse.preview(name: "Tatooine", url: "123"),
            personRepository: PreviewPersonRepository()
        )
    }
    
}
