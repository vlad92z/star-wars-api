//
//  CoreDataPersonRepositoryTests.swift
//  starwarsdirectory
//
//  Created by Vlad on 10/03/2025.
//
import Testing
@testable import starwarsdirectory

struct CoreDataPersonRepositoryTests {
    
    let persistenceController = PersistenceController(inMemory: true)
    
    @Test
    func getPeopleSucess() async throws {
        let context = persistenceController.container.viewContext
        let expectedPerson1 = PersonResponse.preview(name: "Test Person", url: "www.person.com/3")
        let expectedPerson2 = PersonResponse.preview(name: "Another Person", url: "www.person.com/4")
        let expectedEdit1 = "1"
        let expectedEdit2 = "2"
        PersonEntity.process(response: expectedPerson1, editDate: expectedEdit1, in: context)
        PersonEntity.process(response: expectedPerson2, editDate: expectedEdit2, in: context)
        try context.save()
        
        let personRepository = CoreDataPersonRepository(context: context)
        let people = await personRepository.getPeople(idList: [expectedPerson1.id, expectedPerson2.id])
        
        #expect(people.count == 2)
        #expect(people[0].url == expectedPerson1.url)
        #expect(people[0].url == expectedPerson1.url)
        #expect(people[0].edited == expectedEdit1)
        #expect(people[1].name == expectedPerson2.name)
        #expect(people[1].name == expectedPerson2.name)
        #expect(people[1].edited == expectedEdit2)
    }
    
    @Test
    func persistPeople() async throws {
        let context = persistenceController.container.viewContext
        let expectedPerson1 = PersonResponse.preview(name: "Test Person", url: "www.person.com/1")
        let expectedPerson2 = PersonResponse.preview(name: "Another Person", url: "www.person.com/2")
        let expectedEdit1 = "1"
        let expectedEdit2 = "2"
        
        let personRepository = CoreDataPersonRepository(context: context)
        await personRepository.persist(people: [expectedPerson1, expectedPerson2])
        
        let people = await personRepository.getPeople(idList: [expectedPerson1.id, expectedPerson2.id])
        
        #expect(people.count == 2)
        #expect(people[0].url == expectedPerson1.url)
        #expect(people[0].url == expectedPerson1.url)
        #expect(people[1].name == expectedPerson2.name)
        #expect(people[1].name == expectedPerson2.name)
        #expect(people[0].edited == people[1].edited)
    }
}
