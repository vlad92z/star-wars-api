//
//  CachingPersonRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct CachingPersonRepositoryTests {
    
    let localRepository = MockPersonRepository()
    let remoteRepository = MockPersonRepository()
    
    @Test("getPeople returns result from persistingRepository first")
    func getPeopleFromLocal() async {
        let localIds = ["ww1.local.com", "ww2.local.com"]
        let remoteIds = ["ww1.remote.com", "ww2.remote.com"]
        let localPeople = [
            PersonResponse.preview(name: "local1", url: localIds[0]),
            PersonResponse.preview(name: "local2", url: localIds[1])
        ]
        let remotePeople = [
            PersonResponse.preview(name: "remote1", url: remoteIds[0]),
            PersonResponse.preview(name: "remote2", url: remoteIds[1])
        ]
        localRepository.people = localPeople
        remoteRepository.people = remotePeople
        let cachingRepository = CachingPersonRepository(
            persistingRepository: localRepository,
            remoteRepository: remoteRepository
        )
        let cachedPeople = await cachingRepository.getPeople(idList: localIds)
        #expect(cachedPeople.count == localIds.count)
        #expect(cachedPeople[0].id == localIds[0])
        #expect(cachedPeople[1].id == localIds[1])
    }
    
    @Test("getPeople returns result from remoteRepository and persists the result")
    func getPeopleFromRemote() async {
        let localIds = ["ww1.local.com", "ww2.local.com"]
        let remoteIds = ["ww1.remote.com", "ww2.remote.com"]
        let localPeople = [
            PersonResponse.preview(name: "local1", url: localIds[0]),
            PersonResponse.preview(name: "local2", url: localIds[1])
        ]
        let remotePeople = [
            PersonResponse.preview(name: "remote1", url: remoteIds[0]),
            PersonResponse.preview(name: "remote2", url: remoteIds[1])
        ]
        localRepository.people = localPeople
        remoteRepository.people = remotePeople
        let cachingRepository = CachingPersonRepository(
            persistingRepository: localRepository,
            remoteRepository: remoteRepository
        )
        let cachedPeople = await cachingRepository.getPeople(idList: remoteIds)
        #expect(cachedPeople.count == remoteIds.count)
        #expect(cachedPeople[0].id == remoteIds[0])
        #expect(cachedPeople[1].id == remoteIds[1])
        #expect(localRepository.people[0].id == remoteIds[0])
        #expect(localRepository.people[1].id == remoteIds[1])
    }
}
