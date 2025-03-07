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

class AlamoPersonApi: PersonAPI {
    
    private let api: AlamofireAPI<PersonResponse>
        
    init(api: AlamofireAPI<PersonResponse> = AlamofireAPI<PersonResponse>()) {
        self.api = api
    }
    
    func requestPerson(_ url: String) async throws -> PersonResponse {
        return try await api.get(url)
    }
}
