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
    
    private let hostURL = URL(string: "https://api.github.com")!
    private let usersPath = "users"
    
    private var profileTask: Task<Void, Never>?
    
    @Published
    private(set) var fetchedProfile: GithubProfileViewModel?
    
    @Published
    private(set) var isLoadingProfile = false
    
    @Published
    var shouldDisplayFailure = false
    
    // TODO: Add a property to display errors.
    // TODO: Add a service to handle and report errors.
    
    // MARK: Imperatives
    
    func fetchProfile(using username: String) {
        fetchedProfile = nil
        profileTask?.cancel()
        profileTask = Task(priority: .userInitiated) {
            isLoadingProfile = true
            
            do {
                let data = try await data(for: username)
                let user = try user(from: data)
                
                guard !Task.isCancelled else {
                    return
                }
                
                fetchedProfile = GithubProfileViewModel(user: user)

            } catch {
                shouldDisplayFailure = true
            }
            
            isLoadingProfile = false
        }
    }
    
    // MARK: Internal Methods
    
    private func data(for username: String) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: profileURL(for: username))
        return data
    }
    
    private func profileURL(for username: String) -> URL {
        hostURL.appendingPathComponent(usersPath).appendingPathComponent(username)
    }
    
    private func user(from data: Data) throws -> GithubUser {
        let decoder = JSONDecoder()
        return try decoder.decode(GithubUser.self, from: data)
    }
}
