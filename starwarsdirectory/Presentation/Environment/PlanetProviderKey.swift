//
//  PlanetProviderKey.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

import SwiftUICore

private struct PlanetProviderKey: EnvironmentKey {
    static let defaultValue: any PlanetProviding = PreviewPlanetProvider()
}

extension EnvironmentValues {
    var planetProvider: any PlanetProviding {
        get { self[PlanetProviderKey.self] }
        set { self[PlanetProviderKey.self] = newValue }
    }
}
