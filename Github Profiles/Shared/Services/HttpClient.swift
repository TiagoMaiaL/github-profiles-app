//
//  HttpClient.swift
//  HttpClient
//
//  Created by Tiago Lopes on 14/08/21.
//

import Foundation

// MARK: - HttpClient

final class HttpClient {
    
    // MARK: Properties
    
    private let session = URLSession.shared
    private lazy var decoder = JSONDecoder()
    
    // MARK: Imperatives
    
    func resource<T>(from url: URL) async throws -> T where T: Decodable {
        let result: (data: Data, response: URLResponse)
        
        do {
            result = try await session.data(from: url)
        } catch {
            throw HttpError.connectionFailure
        }
        
        try checkErrors(from: result.response)
        let resource: T = try parse(from: result.data)
        
        return resource
    }
    
    // MARK: Internal Methods
    
    // TODO: Inform the errors.
    func checkErrors(from response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HttpError.unknownFailure
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw HttpError.requestFailed(statusCode: httpResponse.statusCode)
        }
    }
    
    func parse<T>(from data: Data) throws -> T where T: Decodable {
        try decoder.decode(T.self, from: data)
    }
}

// MARK: - Errors

enum HttpError: Error, Equatable {
    case connectionFailure
    case unknownFailure
    case requestFailed(statusCode: Int)
}
