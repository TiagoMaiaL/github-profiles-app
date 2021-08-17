//
//  Repository.swift
//  Repository
//
//  Created by Tiago Lopes on 16/08/21.
//

import Foundation

struct Repository: Codable, Equatable {
    
    // MARK: Properties
    
    let name: String
    let description: String?
    let stars: Int
    let watchers: Int
    let language: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case stars = "stargazers_count"
        case watchers = "watchers_count"
        
        case name
        case description
        case language
    }
}
