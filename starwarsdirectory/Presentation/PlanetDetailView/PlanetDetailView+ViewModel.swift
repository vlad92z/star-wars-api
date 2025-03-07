//
//  PlanetDetailView+ViewModel.swift
//  starwarsdirectory
//
//  Created by Vlad on 07/03/2025.
//
import Combine

extension PlanetDetailView {
    
    class ViewModel: ObservableObject {
        
        private let personRepository: PersonRepository
        
        let planet: PlanetResponse
        
        @Published var residents: [PersonResponse] = []
        @Published var isLoading = false
        
        init(personRepository: PersonRepository, planet: PlanetResponse) {
            self.personRepository = personRepository
            self.planet = planet
        }
        
        @MainActor
        func updateResidents() async {
            isLoading = true
            let updatedResidents = await personRepository.getPeople(idList: planet.residents)
            residents = updatedResidents
            isLoading = false
        }
    }
}
