//
//  PersonRepositoryKey.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUICore

private struct PersonRepositoryKey: EnvironmentKey {
    static let defaultValue: any PersonRepository = PreviewPersonRepository()
}

extension EnvironmentValues {
    var personRepository: any PersonRepository {
        get { self[PersonRepositoryKey.self] }
        set { self[PersonRepositoryKey.self] = newValue }
    }
}
