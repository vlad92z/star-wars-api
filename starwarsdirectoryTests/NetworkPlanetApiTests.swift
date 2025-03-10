//
//  NetworkPlanetApiTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 09/03/2025.
//
import Testing
@testable import starwarsdirectory

struct NetworkPlanetApiTests {
    
    let expectedUrl = "www.test.com"
    let expectedParameters = ["key" : "vaue"]
    let mockApi = MockNetworkApi<PlanetListResponse>()
    
    @Test("PlanetAPI calls returns PlanetListResponse from API")
    func requestPlanetsSuccess() async throws {
        let expectedPlanet = PlanetResponse.preview(name: "Planet", url: "www.planet.com")
        let expectedResponse = PlanetListResponse(
            count: 1,
            next: nil,
            previous: nil,
            results: [expectedPlanet]
        )
        mockApi.result = .success(expectedResponse)
        let planetApi = NetworkPlanetApi(api: mockApi)
        let planetListResponse = try await planetApi.requestPlanets(
            expectedUrl,
            parameters: expectedParameters
        )
        let planets = planetListResponse.results
        let parameters = mockApi.parameters as? [String: String]
        #expect(planetListResponse.count == 1)
        #expect(planets.count == 1)
        #expect(planets[0].url == expectedPlanet.url)
        #expect(mockApi.url == expectedUrl, "Wrong url was passed to the API")
        #expect(parameters?["key"] == expectedParameters["key"])
    }
    
    @Test("PlanetAPI rethrows error from API")
    func requestPlanetsThrows() async throws {
        let expectedError = NetworkError.invalidResponse(statusCode: 401, error: nil)
        mockApi.result = .failure(expectedError)
        let planetApi = NetworkPlanetApi(api: mockApi)
        await #expect(throws: NetworkError.self) {
            try await planetApi.requestPlanets(expectedUrl, parameters: expectedParameters)
        }
        let parameters = mockApi.parameters as? [String: String]
        #expect(mockApi.url == expectedUrl, "Wrong url was passed to the API")
        #expect(parameters?["key"] == expectedParameters["key"])
    }
}
