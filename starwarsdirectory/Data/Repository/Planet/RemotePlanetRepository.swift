//
//  RemotePlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import os.log

class RemotePlanetRepository: PaginatedPlanetRepository {
    
    private let api: PlanetAPI
    private(set) var hasNextPage = true
    
    init(api: PlanetAPI = NetworkPlanetApi()) {
        self.api = api
    }
    
    func getPlanets(for page: Int) async -> [PlanetResponse] {
        do {
            let url = SwapiUrl.planets.url
            let parameters: [String: Any] = ["page": page]
            let response = try await api.requestPlanets(url, parameters: parameters)
            hasNextPage = response.next != nil
            return response.results
        } catch {
            Logger.coredata.error("Failed to download planet metadata: \(error.localizedDescription)")
            return []
        }
    }
}
