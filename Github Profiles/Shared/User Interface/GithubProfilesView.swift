//
//  ContentView.swift
//  Shared
//
//  Created by Tiago Lopes on 08/08/21.
//

import SwiftUI

struct GithubProfilesView: View {
    
    // MARK: Properties
    
    @StateObject
    private var viewModel = GithubProfilesViewModel()
    
    @State
    private var searchText: String = ""
    
    // MARK: Body
    
    var body: some View {
        VStack {
            searchBar
            Spacer()
            profileView
            Spacer()
        }
    }
    
    private var searchBar: some View {
        HStack {
            TextField("Search for a Github profile", text: $searchText)
                .onSubmit {
                    viewModel.fetchProfile(using: searchText)
                }
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .background(.thickMaterial)
    }
    
    @ViewBuilder
    private var profileView: some View {
        if let fetchedProfile = viewModel.fetchedProfile {
            VStack {
                // TODO: Display the profile image using AsyncImage.
                Image("octocat_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(fetchedProfile.name)
                    .font(.title)
                
                Text(fetchedProfile.company ?? "No company")
                Text(fetchedProfile.blog ?? "No blog")
                Text(fetchedProfile.location ?? "No location")
            }
            .padding()
            .background(.thickMaterial)
            
        } else {
            EmptyView()
        }
    }
}

// MARK: - Preview

struct GithubProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfilesView()
    }
}
