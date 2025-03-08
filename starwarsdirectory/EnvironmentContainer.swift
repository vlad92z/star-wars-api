//
//  EnvironmentContainer.swift
//  starwarsdirectory
//
//  Created by Vlad on 08/03/2025.
//
import CoreData

struct EnvironmentContainer {
    let persistenceController: PersistenceController
    let personRepository: PersonRepository
    let planetProvider: PlanetProvider
    
    var context: NSManagedObjectContext {
        persistenceController.container.viewContext
    }
}

//MARK: Release
extension EnvironmentContainer {
    
    static var release: EnvironmentContainer {
        let persistenceController = PersistenceController.shared
        let context = persistenceController.container.viewContext
        
        let personRepository = CachingPersonRepository(
            coreDataRepository: CoreDataPersonRepository(context: context),
            remoteRepository: RemotePersonRepository()
        )
        
        let planetRepository = CachingPlanetRepository(
            coreDataRepository: CoreDataPlanetRepository(context: context),
            remoteRepository: RemotePlanetRepository()
        )
        let planetProvider = PlanetProvider(repository: planetRepository)
        
        return EnvironmentContainer(persistenceController: persistenceController,
                                    personRepository: personRepository,
                                    planetProvider: planetProvider)
    }
}
