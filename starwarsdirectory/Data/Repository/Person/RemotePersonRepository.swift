//
//  RemotePlanetRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
class RemotePersonRepository: PersonRepository {
    
    private let api: PersonAPI
    
    init(api: PersonAPI = AlamoPersonApi()) {
        self.api = api
    }
    
    func getPeople(idList: [String]) async -> [PersonResponse] {
        do {
            return try await withThrowingTaskGroup(of: PersonResponse.self) { group in
                for url in idList {
                    group.addTask {
                        try await self.api.requestPerson(url)
                    }
                }
                var results: [PersonResponse] = []
                for try await person in group {
                    results.append(person)
                }
                return results
            }
        } catch {
            //TODO: Log Error
            return []
        }
    }
}
