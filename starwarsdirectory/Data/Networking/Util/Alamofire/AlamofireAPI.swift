//
//  AlamofireAPI.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Alamofire
import Foundation

struct AlamofireAPI<T: Decodable>: NetworkAPI {
    
    func request(url: String, method: RequestMethod, headers: [String : String]?) async throws -> T {
        let headers = HTTPHeaders(headers ?? [:])
        let request = if let params = method.parameters {
            AF.request(url, method: method.toAlamofire, parameters: params, headers: headers)
        } else {
            AF.request(url, method: method.toAlamofire, headers: headers)
        }
        let result = await request
            .cacheResponse(using: .cache)
            .validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
            .result
        switch result {
        case .success(let serialized):
            return serialized
        case .failure(let error):
            throw NetworkError(from: error)
        }
    }
    
    // consider storing it somewhere to avoid instantiating for every request
    private var decoder: JSONDecoder {
        let snakeDecoder = JSONDecoder()
        snakeDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return snakeDecoder
    }
}
