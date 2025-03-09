//
//  PersonAPI.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Alamofire

protocol PersonAPI {
    
    func requestPerson(_ url: String) async throws -> PersonResponse
}

class NetworkPersonApi<API: NetworkAPI>: PersonAPI where API.T == PersonResponse {
    
    let api: API

    init(api: API = AlamofireAPI<PersonResponse>()) {
        self.api = api
    }
    
    func requestPerson(_ url: String) async throws -> PersonResponse {
        return try await api.get(url)
    }
}
