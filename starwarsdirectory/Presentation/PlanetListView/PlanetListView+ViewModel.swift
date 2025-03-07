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
        
        @Published var planets: [PlanetResponse] = []
        @Published var canLoadMore: Bool = true
        @Published var errorMessage: String?
        
        init(planetProvider: PlanetProviding) {
            self.planetProvider = planetProvider
        }
        
        func loadMore() async {
            guard canLoadMore else {
                return
            }

            let newPlanets = await planetProvider.loadNext()
            await MainActor.run {
                if newPlanets.isEmpty {
                    canLoadMore = false
                }
                planets.append(contentsOf: newPlanets)
            }
        }
    }
}
