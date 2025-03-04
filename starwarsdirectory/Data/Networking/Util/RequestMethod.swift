//
//  RequestMethod.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

// Can be expanded with other request methods
enum RequestMethod {
    case get([String: Any]?)
    case post([String: Any]?)
    
    var parameters: [String: Any]? {
        switch self {
        case .get(let parameters):
            return parameters
        case .post(let parameters):
            return parameters
        }
    }
}
