//
//  MockNetworkApi.swift
//  starwarsdirectory
//
//  Created by Vlad on 09/03/2025.
//
@testable import starwarsdirectory

final class MockNetworkApi<T: Decodable>: NetworkAPI {
    
    var result: Result<T, NetworkError>?
    var url: String?
    var parameters: [String : Any]?
    
    func request(url: String, method: RequestMethod, headers: [String : String]?) async throws -> T {
        self.url = url
        self.parameters = method.parameters
        guard let result = result else {
            throw NetworkError.decodingFailure(error: nil)
        }
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

