//
//  GithubRepositoriesListView.swift
//  GithubRepositoriesListView
//
//  Created by Tiago Lopes on 21/08/21.
//

import SwiftUI

struct GithubRepositoriesListView: View {
    
    // MARK: Properties
    
    let repositories: [GithubRepositoryViewModel]
    
    // MARK: Body
    
    var body: some View {
        VStack {
            HStack {
                Text("Repositories")
                    .font(.title3)
                
                Spacer()
            }
            .padding(.vertical)
            
            ForEach(repositories) { repository in
                VStack {
                    GithubRepositoryView(viewModel: repository)
                    Divider()
                        .padding(.vertical)
                }
            }
        }
    }
}

// MARK: - Preview

struct GithubRepositoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        let models = [
            GithubRepository(
                id: 1,
                name: "Repository 1",
                description: "The first repo.",
                stars: 5,
                watchers: 0,
                forks: 0,
                language: "HTML"
            ),
            GithubRepository(
                id: 2,
                name: "Repository 2",
                description: "The second repo.",
                stars: 1,
                watchers: 2,
                forks: 1,
                language: "Javascript"
            )
        ]
        let viewModels = models.map(GithubRepositoryViewModel.init)
        
        return GithubRepositoriesListView(repositories: viewModels)
    }
}
