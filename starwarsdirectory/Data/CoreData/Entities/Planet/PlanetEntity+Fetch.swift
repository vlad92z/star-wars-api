//
//  PlanetEntity+Fetch.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData

extension PlanetEntity {
    static func fetch(_ predicate: NSPredicate? = nil) -> NSFetchRequest<PlanetEntity> {
        let request = PlanetEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: KeyPath.url, ascending: false)]
        if let predicate = predicate {
            request.predicate = predicate
        }
        return request
    }
    
    static func fetch(url: String) -> NSFetchRequest<PlanetEntity> {
        return fetch(NSPredicate(format: "%K == %@", KeyPath.url, url))
    }
    
    static func fetch(page: Int) -> NSFetchRequest<PlanetEntity> {
        return fetch(NSPredicate(format: "%K == %i", KeyPath.page, page))
    }
}
