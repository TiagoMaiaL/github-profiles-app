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
    var company: String? { user.company }
    var location: String? { user.location }
    var blog: String? { user.blog }
    // TODO: Map this model to a view model.
    private(set) var repositories: [Repository]?
    
    // MARK: Initializer
    
    init(user: GithubUser, repositories: [Repository]?) {
        self.user = user
        self.repositories = repositories
    }
}
