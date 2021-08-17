//
//  GithubUser.swift
//  GithubUser
//
//  Created by Tiago Lopes on 10/08/21.
//

import Foundation

struct GithubUser: Codable, Equatable {
    
    // MARK: Properties
    
    let login: String
    let name: String?
    let location: String?
    let avatarUrl: URL?
    let publicRepositoriesCount: Int
    let publicRepositoriesUrl: URL
    let blog: String?
    let company: String?
    let bio: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case publicRepositoriesCount = "public_repos"
        case publicRepositoriesUrl = "repos_url"
        
        case login
        case name
        case location
        case blog
        case company
        case bio
    }
}

