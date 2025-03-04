//
//  PlanetProvider.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//

protocol PlanetProviding {
    
    var hasNext: Bool { get }
    var hasPrevious: Bool { get }
    
    func loadNext() async -> Result<[Planet], PlanetProviderError>
    func loadPrevious() async -> Result<[Planet], PlanetProviderError>
}

enum PlanetProviderError: Error {
    case unavailable(message: String)
    case networkError(error: Error)
}

class PlanetProvider: PlanetProviding {
    
    private let api: PlanetAPI
    private var nextPage: String?
    private var previousPage: String?
    
    init(api: PlanetAPI = AlamoPlanetApi(), firstPage: String = SwapiUrl.planets.url) {
        self.api = api
        self.nextPage = firstPage
    }
    
    var hasNext: Bool { nextPage != nil }
    var hasPrevious: Bool { previousPage != nil }
    
    func loadNext() async -> Result<[Planet], PlanetProviderError> {
        do {
            guard let nextUrl = nextPage else {
                return Result.failure(.unavailable(message: "No more planets to load"))
            }
            let response = try await api.requestPlanets(nextUrl)
            self.previousPage = response.previous
            self.nextPage = response.next
            return .success(response.results)
        } catch {
            return .failure(.networkError(error: error))
        }
    }
    
    func loadPrevious() async -> Result<[Planet], PlanetProviderError> {
        guard let previousUrl = previousPage else {
            return Result.failure(.unavailable(message: "No more planets to load"))
        }
        return await load(url: previousUrl)
    }
    
    private func load(url: String) async -> Result<[Planet], PlanetProviderError> {
        do {
            let response = try await api.requestPlanets(url)
            self.previousPage = response.previous
            self.nextPage = response.next
            return .success(response.results)
        } catch {
            return .failure(.networkError(error: error))
        }
    }
}
