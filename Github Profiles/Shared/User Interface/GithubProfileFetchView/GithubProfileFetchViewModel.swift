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
    
    private var profileTask: Task<GithubUser, Error>?
    
    @Published
    private(set) var fetchedProfile: GithubProfileViewModel?
    
    @Published
    private(set) var isLoadingProfile = false
    
    // TODO: Display the native loading indicator.
    // TODO: Add a property to display errors.
    
    // MARK: Imperatives
    
    func fetchProfile(using username: String) {
        fetchedProfile = nil
        profileTask?.cancel()
        profileTask = Task(priority: .userInitiated) {
            isLoadingProfile = true
            
            let data = try await data(for: username)
            let user = try user(from: data)
            
            try Task.checkCancellation()
            
            isLoadingProfile = false
            fetchedProfile = GithubProfileViewModel(user: user)
            
            return user
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
