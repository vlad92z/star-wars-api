//
//  CoreDataPersonRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import Combine

class CoreDataPersonRepository: PersonRepository {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getPeople(idList: [String]) async -> [PersonResponse] {
        let request = PersonEntity.fetch(urls: idList)
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.personResponse }
        } catch {
            //TODO: Log error
            return []
        }
    }
    
    func persist(people: [PersonResponse]) async {
        await PersonEntity.persist(response: people, in: context)
    }
}
