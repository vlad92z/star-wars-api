//
//  PlanetRepositoryKey.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUICore

private struct PlanetRepositoryKey: EnvironmentKey {
    static let defaultValue: any PaginatedPlanetRepository = PreviewPlanetRepository()
}

extension EnvironmentValues {
    var planetRepository: any PaginatedPlanetRepository {
        get { self[PlanetRepositoryKey.self] }
        set { self[PlanetRepositoryKey.self] = newValue }
    }
}
