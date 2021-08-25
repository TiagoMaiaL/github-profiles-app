//
//  GithubProfileFetchViewModel.swift
//  GithubProfileFetchViewModel
//
//  Created by Tiago Lopes on 09/08/21.
//

import Foundation
import Combine

final class GithubProfileFetchViewModel: ObservableObject {
    
    // MARK: Properties
    
    private let client = HttpClient()
    
    // MARK: State
    
    enum State: Equatable {
        case `default`
        case loading
        case fetched(profile: GithubProfileViewModel)
        case failure(error: HttpError)
    }
    
    @Published
    private(set) var state = State.default
    
    // MARK: Imperatives
    
    func fetchProfile(using username: String) {
        // TODO: Step 2 - Use the async HttpClient in the view model
        
        guard !username.isEmpty else {
            state = .`default`
            return
        }
        
        state = .loading
        
        let url = profileURL(for: username)
        client.fetchResource(from: url) { [weak self] (result: Result<GithubUser, HttpError>) in
            switch result {
            case .success(let user):
                self?.client.fetchResource(from: user.publicRepositoriesUrl) { [weak self] (result: Result<[GithubRepository], HttpError>) in
                    switch result {
                    case .success(let repositories):
                        let profile = GithubProfileViewModel(user: user, repositories: repositories)
                        DispatchQueue.main.async { [weak self] in
                            self?.state = .fetched(profile: profile)
                        }
                        
                    case .failure(let error):
                        DispatchQueue.main.async { [weak self] in
                            self?.state = .failure(error: error)
                        }
                    }
                }
                
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.state = .failure(error: error)
                }
            }
        }
    }
    
    // MARK: Internal Methods
    
    private func profileURL(for username: String) -> URL {
        let hostURL = URL(string: "https://api.github.com")!
        let usersPath = "users"
        
        return hostURL
            .appendingPathComponent(usersPath)
            .appendingPathComponent(username)
    }
}
