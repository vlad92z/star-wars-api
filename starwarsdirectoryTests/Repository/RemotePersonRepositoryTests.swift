//
//  RemotePersonRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct RemotePersonRepositoryTests {
    
    private let personApi = MockPersonApi()
    
    @Test("getPeople returns list of people when API call succeeds")
    func getPeopleSuccess() async {
        let urls = ["ww1.person.com", "ww2.person.com"]
        let expectedResponses = [
            urls[0]: PersonResponse.preview(name: "1", url: urls[0]),
            urls[1]: PersonResponse.preview(name: "2", url: urls[1])
        ]
        personApi.responseMap = expectedResponses
        
        let repository = RemotePersonRepository(api: personApi)
        let people = await repository.getPeople(idList: urls)
        #expect(people.count == 2)
        #expect(people[0].name == "1")
        #expect(people[0].url == urls[0])
        #expect(people[1].name == "2")
        #expect(people[1].url == urls[1])
    }
    
    @Test("getPeople returns empty list when API call throws an error")
    func getPeopleFailure() async {
        let urls = ["ww1.person.com", "ww2.person.com", "ww3.person.com"]
        let expectedResponses = [
            urls[0]: PersonResponse.preview(name: "1", url: urls[0]),
            urls[1]: PersonResponse.preview(name: "2", url: urls[1])
        ]
        personApi.responseMap = expectedResponses
        
        let repository = RemotePersonRepository(api: personApi)
        let people = await repository.getPeople(idList: urls)
        #expect(people.isEmpty)
    }
}
