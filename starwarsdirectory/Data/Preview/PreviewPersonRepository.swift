//
//  PreviewPersonRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 07/03/2025.
//

class PreviewPersonRepository: PersonRepository {
    
    func getPeople(idList: [String]) async -> [PersonResponse] {
        return [
            PersonResponse.preview(name: "Luke Skywalker", url: "https://swapi.dev/api/people/1/"),
            PersonResponse.preview(name: "L-3PO", url: "https://swapi.dev/api/people/2/"),
            PersonResponse.preview(name: "R2-D2", url: "https://swapi.dev/api/people/3/"),
            PersonResponse.preview(name: "Darth Vader", url: "https://swapi.dev/api/people/4/")
        ]
    }
    
    
}
