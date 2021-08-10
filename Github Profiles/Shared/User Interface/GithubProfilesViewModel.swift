//
//  GithubProfilesViewModel.swift
//  GithubProfilesViewModel
//
//  Created by Tiago Lopes on 09/08/21.
//

import Foundation

final class GithubProfilesViewModel {
    
    // MARK: Properties
    
    // TODO: Add a property for the user already fetched here.
    // TODO: Add a property to display errors.
    
    private let hostURL = URL(string: "https://api.github.com")!
    private let usersPath = "users"
    
    private var profileTask: Task<GithubUser, Error>?
    
    // MARK: Imperatives
    
    func fetchProfile(using username: String) {
        profileTask = Task {
            let (data, _) = try await URLSession.shared.data(from: profileURL(for: username))
            let user = try user(from: data)
            // TODO: Inform it by using the view model.
        }

//        // TODO: Call the user endpoint.
    }
    
    // MARK: Internal Methods
    
    private func profileURL(for username: String) -> URL {
        hostURL.appendingPathComponent(usersPath).appendingPathComponent(username)
    }
    
    private func user(from data: Data) throws -> GithubUser {
        let decoder = JSONDecoder()
        return try decoder.decode(GithubUser.self, from: data)
    }
}
