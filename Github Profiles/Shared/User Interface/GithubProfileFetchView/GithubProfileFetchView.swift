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
            SearchBar(searchText: $searchText) {
                viewModel.fetchProfile(using: searchText)
            }
            .padding()
            
            Spacer()
            
            switch viewModel.state {
            case .`default`:
                DefaultProfileView()
                
            case .fetched(let profileViewModel):
                ScrollView {
                    GithubProfileView(viewModel: profileViewModel)
                        .padding()
                }
                
            case .loading:
                LoadingIndicator()
                
            case .failure(let error):
                if error == .requestFailed(statusCode: 404) {
                    ErrorView.profileNotFound()
                } else {
                    ErrorView.connectionError()
                }
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview

struct GithubProfileFetchView_Previews: PreviewProvider {
    // TODO: Put all preview variations here (loading, fetched, failure).
    
    static var previews: some View {
        GithubProfileFetchView()
    }
}
