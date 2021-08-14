//
//  GithubProfileFetchView.swift
//  GithubProfileFetchView
//
//  Created by Tiago Lopes on 08/08/21.
//

import SwiftUI

struct GithubProfileFetchView: View {
    
    // MARK: Properties
    
    @StateObject
    private var viewModel = GithubProfileFetchViewModel()
    
    @State
    private var searchText: String = ""
    
    // MARK: Body
    
    var body: some View {
        VStack {
            searchBar
            
            Spacer()
            
            switch viewModel.state {
            case .`default`:
                EmptyView()
                
            case .fetched(let profileViewModel):
                GithubProfileView(viewModel: profileViewModel)
                
            case .loading:
                ProgressView()
                
            case .failure:
                // TODO: Display the fetch failure.
                EmptyView()
            }
            
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
}

// MARK: - Preview

struct GithubProfileFetchView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfileFetchView()
    }
}
