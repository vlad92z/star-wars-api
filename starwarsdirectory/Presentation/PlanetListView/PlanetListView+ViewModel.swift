//
//  PlanetListView+ViewModel.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Combine

extension PlanetListView {
    
    class ViewModel: ObservableObject {
        
        private let repository: PaginatedPlanetRepository
        
        private var currentPage = 0
        
        @Published var planets: [PlanetResponse] = []
        @Published var canLoadMore: Bool = true
        
        init(repository: PaginatedPlanetRepository) {
            self.repository = repository
        }
        
        func loadMore() async {
            guard canLoadMore else {
                return
            }
            currentPage += 1
            let newPlanets = await repository.getPlanets(for: currentPage)
            await MainActor.run {
                if newPlanets.isEmpty {
                    canLoadMore = false
                }
                planets.append(contentsOf: newPlanets)
            }
        }
    }
}
