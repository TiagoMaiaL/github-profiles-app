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
    
    enum State {
        case `default`
        case loading
        case fetched(profile: GithubProfileViewModel)
        case failure
    }
    
    @Published
    private(set) var state = State.default
    
    // TODO: Add a binding property to display generic errors via alert.
    
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
                // TODO: Fetch for the followers and projects.
                
                guard !Task.isCancelled else {
                    return
                }
                
                state = .fetched(profile: GithubProfileViewModel(user: user))
                
            } catch {
                state = .failure
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
