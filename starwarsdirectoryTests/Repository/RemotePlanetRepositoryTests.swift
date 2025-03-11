//
//  RemotePlanetRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct RemotePlanetRepositoryTests {
    
    private let planetApi = MockPlanetApi()
    
    @Test("getPlanets returns list of planets when API call succeeds")
    func getPlanetsSuccess() async {
        let expectedPage = 1
        let expectedUrl = SwapiUrl.planets.url
        let expectedResponse = PlanetListResponse(
            count: 1,
            next: nil,
            previous: nil,
            results: [
                PlanetResponse.preview(name: "Planet", url: "ww1.planet.com"),
                PlanetResponse.preview(name: "Planet2", url: "ww2.planet.com")
            ]
        )
        planetApi.responseMap = [expectedUrl: expectedResponse]
        
        let repository = RemotePlanetRepository(api: planetApi)
        let planets = await repository.getPlanets(for: expectedPage)
        let parameters = planetApi.parameters as? [String: Int]
        #expect(parameters?["page"] == expectedPage, "The correct page was not passed to the API")
        #expect(planets.count == expectedResponse.results.count)
        #expect(planets[0].url == expectedResponse.results[0].url, "Planet response or order do not match")
        #expect(planets[1].url == expectedResponse.results[1].url, "Planet response or order do not match")
    }
    
    @Test("getPlanets returns empty list when API call throws an error")
    func getPlanetsFailure() async {
        let repository = RemotePlanetRepository(api: planetApi)
        let planets = await repository.getPlanets(for: 1)
        #expect(planets.isEmpty)
    }
}
