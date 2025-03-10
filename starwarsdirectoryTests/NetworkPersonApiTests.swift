//
//  NetworkPersonApiTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 09/03/2025.
//
import Testing
@testable import starwarsdirectory

struct NetworkPersonApiTests {
    
    let expectedUrl = "www.test.com"
    let mockApi = MockNetworkApi<PersonResponse>()
    
    @Test("PersonAPI calls returns PersonResponse from API")
    func requestPersonSuccess() async throws {
        let expectedPerson = PersonResponse.preview(name: "test person", url: "person.com")
        mockApi.result = .success(expectedPerson)
        let personApi = NetworkPersonApi(api: mockApi)
        let person = try await personApi.requestPerson(expectedUrl)
        #expect(person.url == expectedPerson.url, "Wrong person was returned")
        #expect(mockApi.url == expectedUrl, "Wrong url was passed to the API")
        #expect(mockApi.parameters == nil)
    }
    
    @Test("PersonAPI rethrows error from API")
    func requestPersonThrows() async throws {
        let expectedError = NetworkError.invalidResponse(statusCode: 401, error: nil)
        mockApi.result = .failure(expectedError)
        let personApi = NetworkPersonApi(api: mockApi)
        await #expect(throws: NetworkError.self) {
            try await personApi.requestPerson(expectedUrl)
        }
        #expect(mockApi.url == expectedUrl, "Wrong url was passed to the API")
        #expect(mockApi.parameters == nil)
    }
}
