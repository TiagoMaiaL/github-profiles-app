//
//  GithubRepositoryViewModel.swift
//  GithubRepositoryViewModel
//
//  Created by Tiago Lopes on 20/08/21.
//

import Foundation

struct GithubRepositoryViewModel: Equatable, Identifiable {
    
    // MARK: Properties
    
    private let repository: GithubRepository
    
    var id: Int {
        repository.id
    }

    var name: String {
        repository.name
    }
    
    var description: String? {
        repository.description
    }
    
    var starsCount: Int {
        repository.stars
    }
    
    var watchersCount: Int {
        repository.watchers
    }
    
    var forksCount: Int {
        repository.forks
    }
    
    var programmingLanguage: String? {
        repository.language
    }
    
    // MARK: Initializer
    
    init(repository: GithubRepository) {
        self.repository = repository
    }
}
