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
    
    var starsCount: String {
        String(repository.stars)
    }
    
    var watchersCount: String {
        String(repository.watchers)
    }
    
    var forksCount: String {
        String(repository.forks)
    }
    
    var programmingLanguage: String? {
        repository.language
    }
    
    // MARK: Initializer
    
    init(repository: GithubRepository) {
        self.repository = repository
    }
}
