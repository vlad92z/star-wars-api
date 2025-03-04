//
//  PlanetListView+ViewModel.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Combine

extension PlanetListView {
    
    class ViewModel: ObservableObject {
        
        private let planetProvider: PlanetProviding
        
        @Published var planets: [Planet] = []
        @Published var errorMessage: String?
        
        init(planetProvider: PlanetProviding) {
            self.planetProvider = planetProvider
        }
        
        func loadMore() async {
            guard planetProvider.hasNext else {
                return
            }
            let planetResult = await planetProvider.loadNext()
            switch planetResult {
            case .success(let newPlanets):
                await MainActor.run {
                    planets.append(contentsOf: newPlanets)
                }
            case .failure(let error):
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
