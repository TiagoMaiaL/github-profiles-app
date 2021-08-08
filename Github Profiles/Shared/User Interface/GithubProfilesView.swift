//
//  ContentView.swift
//  Shared
//
//  Created by Tiago Lopes on 08/08/21.
//

import SwiftUI

struct GithubProfilesView: View {
    
    // MARK: Properties
    
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
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .background(.thickMaterial)
    }
    
    private var profileView: some View {
        VStack {
            Image("octocat_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("The Octocat")
                .font(.title)
            
            Text("Company")
            Text("Blog")
            Text("Location")
            
        }
        .padding()
        .background(.thickMaterial)
    }
}

// MARK: - Preview

struct GithubProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfilesView()
    }
}
