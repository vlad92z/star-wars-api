//
//  AlamofireAPI.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Alamofire
import Foundation
import os.log

struct AlamofireAPI<T: Decodable>: NetworkAPI {
    
    func request(url: String, method: RequestMethod, headers: [String : String]?) async throws -> T {
        let headers = HTTPHeaders(headers ?? [:])
        let request = if let params = method.parameters {
            AF.request(url, method: method.toAlamofire, parameters: params, headers: headers)
        } else {
            AF.request(url, method: method.toAlamofire, headers: headers)
        }
        let response = await request
            .cacheResponse(using: .cache)
            .validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
            
        let result = response.result
        switch result {
        case .success(let serialized):
            Logger.network.debug("Network Request Success for \(url)")
            return serialized
        case .failure(let error):
            Logger.network.error("Netweork Request failed for \(url): \(error)")
            throw NetworkError(from: error)
        }
    }
    
    // TODO: Consider storing it somewhere to avoid instantiating for every request
    private var decoder: JSONDecoder {
        let snakeDecoder = JSONDecoder()
        snakeDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return snakeDecoder
    }
}
