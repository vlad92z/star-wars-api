//
//  StarWarsDirectoryApp.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

@main
struct StarWarsDirectoryApp: App {
    
    private let persistenceController = PersistenceController.shared
    private var personRepository = RemotePersonRepository()
    private var planetProvider = PlanetProvider(repository: CachingPlanetRepository(
        coreDataRepository: CoreDataPlanetRepository(
            context: PersistenceController.shared.container.viewContext
        ),
        remoteRepository: RemotePlanetRepository())
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.planetProvider, planetProvider)
                .environment(\.personRepository, personRepository)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
