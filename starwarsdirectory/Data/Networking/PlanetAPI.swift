//
//  PlanetNetworking.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Alamofire

protocol PlanetAPI {
    
    func requestPlanets(_ url: String, parameters: [String : Any]?) async throws -> PlanetListResponse
}

class NetworkPlanetApi<API: NetworkAPI>: PlanetAPI where API.T == PlanetListResponse {
    
    let api: API

    init(api: API = AlamofireAPI<PlanetListResponse>()) {
        self.api = api
    }
    
    func requestPlanets(_ url: String, parameters: [String : Any]?) async throws -> PlanetListResponse {
        return try await api.get(url, parameters: parameters)
    }
}
