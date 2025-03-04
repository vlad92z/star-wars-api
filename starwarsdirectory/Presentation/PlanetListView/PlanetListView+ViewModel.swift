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
        @Published var canLoadMore: Bool
        @Published var errorMessage: String?
        
        init(planetProvider: PlanetProviding) {
            self.planetProvider = planetProvider
            self.canLoadMore = planetProvider.hasNext
        }
        
        func loadMore() async {
            guard canLoadMore else {
                return
            }

            let planetResult = await planetProvider.loadNext()
            await MainActor.run {
                switch planetResult {
                case .success(let newPlanets):
                    planets.append(contentsOf: newPlanets)
                    canLoadMore = planetProvider.hasNext
                case .failure(let error):
                    errorMessage = error.localizedDescription
                    canLoadMore = planetProvider.hasNext
                }
            }
        }
    }
}
