//
//  HttpClient.swift
//  HttpClient
//
//  Created by Tiago Lopes on 14/08/21.
//

import Foundation
import SwiftUI

// MARK: - HttpClient

final class HttpClient {
    
    // MARK: Properties
    
    private let session = URLSession.shared
    private lazy var decoder = JSONDecoder()
    
    // MARK: Imperatives
    
    // TODO: Step 1 - Transform fetchResource(from: using:) into an async method.
    
    func fetchResource<T>(
        from url: URL,
        using completionHandler: @escaping (Result<T, HttpError>) -> Void
    ) where T: Decodable {
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                completionHandler(.failure(.unknownFailure))
                return
            }
            
            guard error == nil else {
                completionHandler(.failure(.connectionFailed))
                return
            }
            
            guard let httpError = response as? HTTPURLResponse else {
                completionHandler(.failure(.unknownFailure))
                return
            }
            
            guard (200...299).contains(httpError.statusCode) else {
                completionHandler(.failure(.requestFailed(statusCode: httpError.statusCode)))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.emptyResultFailure))
                return
            }
            
            do {
                let resource: T = try self.parse(from: data)
                completionHandler(.success(resource))
            } catch {
                completionHandler(.failure(.parsingFailed))
            }
        }
        
        task.resume()
    }
    
    // MARK: Internal Methods
    
    func parse<T>(from data: Data) throws -> T where T: Decodable {
        try decoder.decode(T.self, from: data)
    }
}

// MARK: - Errors

enum HttpError: Error, Equatable {
    case connectionFailed
    case unknownFailure
    case requestFailed(statusCode: Int)
    case parsingFailed
    case emptyResultFailure
}
