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

class AlamoPlanetApi: PlanetAPI {
    
    private let api: AlamofireAPI<PlanetListResponse>
        
    init(api: AlamofireAPI<PlanetListResponse> = AlamofireAPI<PlanetListResponse>()) {
        self.api = api
    }
    
    func requestPlanets(_ url: String, parameters: [String : Any]?) async throws -> PlanetListResponse {
        return try await api.get(url, parameters: parameters)
    }
}
