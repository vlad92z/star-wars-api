//
//  NetworkAPI.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

protocol NetworkAPI {
    
    associatedtype T: Decodable
    
    func request(
        url: String,
        method: RequestMethod,
        headers: [String: String]?) async throws -> T
}

//MARK: SWAPI Helpers
extension NetworkAPI {
    func get(_ url: String, parameters: [String: Any]? = nil) async throws -> T {
        return try await request(url: url, method: .get(parameters), headers: nil)
    }
}
