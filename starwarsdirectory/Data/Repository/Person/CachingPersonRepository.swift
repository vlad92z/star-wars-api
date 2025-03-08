//
//  CachingPersonRepository.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import os.log

class CachingPersonRepository: PersonRepository {
    
    private let coreDataRepository: CoreDataPersonRepository
    private let remoteRepository: RemotePersonRepository
    
    init(coreDataRepository: CoreDataPersonRepository, remoteRepository: RemotePersonRepository) {
        self.coreDataRepository = coreDataRepository
        self.remoteRepository = remoteRepository
    }
    
    func getPeople(idList: [String]) async -> [PersonResponse] {
        let localPeople = await coreDataRepository.getPeople(idList: idList)
        //TODO: Check for Stale data (e.g. update once per day)
        if !localPeople.isEmpty {
            Logger.coredata.debug("Fetched local people")
            return localPeople
        }
        let remotePeople = await remoteRepository.getPeople(idList: idList)
        await coreDataRepository.persist(people: remotePeople)
        return remotePeople
    }
}
