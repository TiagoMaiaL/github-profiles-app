//
//  GithubProfileViewModel.swift
//  GithubProfileViewModel
//
//  Created by Tiago Lopes on 10/08/21.
//

import Foundation

struct GithubProfileViewModel: Equatable {
    
    // MARK: Properties
    
    private let user: GithubUser
    
    var avatarURL: URL? { user.avatarUrl }
    var name: String { user.name ?? user.login }
    var bio: String? { user.bio }
    var company: String? { user.company }
    var location: String? { user.location }
    var blog: String? { user.blog }
    let repositories: [GithubRepositoryViewModel]
    
    // MARK: Initializer
    
    init(user: GithubUser, repositories: [GithubRepository] = []) {
        self.user = user
        self.repositories = repositories.map(
            GithubRepositoryViewModel.init
        )
    }
}
