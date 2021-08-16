//
//  GithubProfileFetchViewModel.swift
//  GithubProfileFetchViewModel
//
//  Created by Tiago Lopes on 09/08/21.
//

import Foundation
import Combine

@MainActor
final class GithubProfileFetchViewModel: ObservableObject {
    
    // MARK: Properties
    
    private let client = HttpClient()
    
    private var profileTask: Task<Void, Never>?
    
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
        guard !username.isEmpty else {
            state = .`default`
            return
        }
        
        profileTask?.cancel()
        profileTask = Task(priority: .userInitiated) {
            state = .loading
            
            do {
                let url = profileURL(for: username)
                let user: GithubUser = try await client.resource(from: url)
                
                // TODO: Fetch the user's projects.
                
                guard !Task.isCancelled else {
                    return
                }
                
                state = .fetched(profile: GithubProfileViewModel(user: user))
                
            } catch {
                let httpError = (error as? HttpError) ?? .unknownFailure
                state = .failure(error: httpError)
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
