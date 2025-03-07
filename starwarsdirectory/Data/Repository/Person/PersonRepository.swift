//
//  PersonRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//

protocol PersonRepository {
    func getPeople(idList: [String]) async -> [PersonResponse]
}
