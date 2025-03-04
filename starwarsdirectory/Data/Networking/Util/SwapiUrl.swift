//
//  SwapiUrl.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

enum SwapiUrl: String {
    
    static let baseUrl: String = "https://swapi.dev/api/"
    
    case planets
    
    var url: String {
        switch self {
        case .planets:
            return SwapiUrl.baseUrl + "planets"
        }
    }
}
