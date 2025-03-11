//
//  MockPersonRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
@testable import starwarsdirectory

class MockPersonRepository: PersistingPersonRepository {
    
    var people: [PersonResponse] = []
    
    func persist(people: [PersonResponse]) async {
        self.people = people
    }
    
    func getPeople(idList: [String]) async -> [PersonResponse] {
        return people.filter { idList.contains($0.url) }
    }
}
