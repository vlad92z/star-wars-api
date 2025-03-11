//
//  MockPersonApi.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
@testable import starwarsdirectory

final class MockPersonApi: PersonAPI {
    
    var responseMap: [String: PersonResponse] = [:]
    
    func requestPerson(_ url: String) async throws -> PersonResponse {
        guard let response = responseMap[url] else {
            throw NetworkError.networkFailure(error: nil)
        }
        return response
    }
}
