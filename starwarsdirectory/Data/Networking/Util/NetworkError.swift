//
//  NetworkError.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//

/**
 * Adds a layer of abstrasction from the networking framework. Error cases can be expanded.
 */
enum NetworkError: Error {
    case networkFailure(error: Error?)
    case decodingFailure(error: Error?)
    case invalidResponse(statusCode: Int, error: Error?)
}
