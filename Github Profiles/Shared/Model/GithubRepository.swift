//
//  GithubRepository.swift
//  GithubRepository
//
//  Created by Tiago Lopes on 16/08/21.
//

import Foundation

struct GithubRepository: Codable, Equatable {
    
    // MARK: Properties
    
    let id: Int
    let name: String
    let description: String?
    let stars: Int
    let watchers: Int
    let forks: Int
    let language: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case stars = "stargazers_count"
        case watchers = "watchers_count"
        case forks = "forks_count"
        
        case id
        case name
        case description
        case language
    }
}
