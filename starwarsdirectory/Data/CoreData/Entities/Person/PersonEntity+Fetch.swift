//
//  PersonEntity+Fetch.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData

extension PersonEntity {
    static func fetch(_ predicate: NSPredicate? = nil) -> NSFetchRequest<PersonEntity> {
        let request = PersonEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: KeyPath.url, ascending: false)]
        if let predicate = predicate {
            request.predicate = predicate
        }
        return request
    }
    
    static func fetch(url: String) -> NSFetchRequest<PersonEntity> {
        return fetch(NSPredicate(format: "%K == %@", KeyPath.url, url))
    }
    
    static func fetch(urls: [String]) -> NSFetchRequest<PersonEntity> {
        guard !urls.isEmpty else {
            return fetch(NSPredicate(value: false))
        }
        return fetch(NSPredicate(format: "%K IN %@", KeyPath.url, urls as NSArray))
    }
}
