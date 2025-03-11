//
//  MockPlanetApi.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
@testable import starwarsdirectory

final class MockPlanetApi: PlanetAPI {
    
    var parameters: [String : Any]?
    var responseMap: [String: PlanetListResponse] = [:]
    
    func requestPlanets(_ url: String, parameters: [String : Any]?) async throws -> PlanetListResponse {
        self.parameters = parameters
        guard let response = responseMap[url] else {
            throw NetworkError.networkFailure(error: nil)
        }
        return response
    }
}
