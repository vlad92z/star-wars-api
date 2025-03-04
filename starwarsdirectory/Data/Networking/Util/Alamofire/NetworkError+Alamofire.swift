//
//  NetworkError+Alamofire.swift
//  starwarsdirectory
//
//  Created by Vlad on 02/03/2025.
//
import Alamofire

extension NetworkError {
    init(from afError: AFError) {
        switch afError {
        case .responseValidationFailed(reason: let reason):
            switch reason {
            case .unacceptableStatusCode(let statusCode):
                self = .invalidResponse(statusCode: statusCode, error: afError)
            default:
                self = .networkFailure(error: afError)
            }
        case .responseSerializationFailed(_):
            self = .decodingFailure(error: afError)
        default:
            self = .networkFailure(error: afError)
        }
    }
}
