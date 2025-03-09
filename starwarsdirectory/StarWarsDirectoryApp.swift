//
//  StarWarsDirectoryApp.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUI

@main
struct StarWarsDirectoryApp: App {
    
    private let environment = EnvironmentContainer.release
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.planetRepository, environment.planetRepository)
                .environment(\.personRepository, environment.personRepository)
                .environment(\.managedObjectContext, environment.context)
        }
    }
}
