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
    
    @Published
    private(set) var fetchedProfile: GithubProfileViewModel?
    
    @Published
    private(set) var isLoadingProfile = false
    
    @Published
    var shouldDisplayFailure = false
    
    // TODO: Use the state pattern here.
    // TODO: Add a property to display errors.
    
    // MARK: Imperatives
    
    func fetchProfile(using username: String) {
        fetchedProfile = nil
        profileTask?.cancel()
        profileTask = Task(priority: .userInitiated) {
            isLoadingProfile = true
            
            do {
                let url = profileURL(for: username)
                let user: GithubUser = try await client.resource(from: url)
                // TODO: Fetch for the followers and projects.
                
                guard !Task.isCancelled else {
                    return
                }
                
                fetchedProfile = GithubProfileViewModel(user: user)
                
            } catch {
                inform(error)
            }
            
            isLoadingProfile = false
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
    
    private func inform(_ error: Error) {
        // TODO: Inform the error.
        shouldDisplayFailure = true
    }
}
