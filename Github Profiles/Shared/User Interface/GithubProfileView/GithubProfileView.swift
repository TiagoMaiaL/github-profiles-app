//
//  GithubProfileView.swift
//  GithubProfileView
//
//  Created by Tiago Lopes on 13/08/21.
//

import SwiftUI

struct GithubProfileView: View {
    
    // MARK: Properties
    
    var viewModel: GithubProfileViewModel
    
    private var isRunningInPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    // MARK: Body
    
    var body: some View {
        VStack {
            profileImage
            
            Text(viewModel.name)
                .font(.title)
            
            Text(viewModel.company ?? "No company")
            Text(viewModel.blog ?? "No blog")
            Text(viewModel.location ?? "No location")
        }
        .padding()
        .background(.thickMaterial)
    }
    
    @ViewBuilder
    private var profileImage: some View {
        if isRunningInPreview {
            Image("octocat_image")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
        } else {
            AsyncImage(url: viewModel.avatarURL) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(minWidth: 0, minHeight: 300)
            // TODO: Make the progress view and the image have the same size.
        }
    }
}

// TODO: Add a text only if we have a value.

// MARK: - Preview

struct GithubProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = GithubUser(
            login: "octocat",
            name: "The Octocat",
            location: "San Francisco",
            avatarUrl: nil,
            publicRepositoriesCount: 5,
            publicRepositoriesUrl: URL(string: "github.com")!,
            blog: "www.octoblog.com",
            company: "Github",
            bio: "Half cat, half octopus"
        )
        
        GithubProfileView(viewModel: GithubProfileViewModel(user: user, repositories: nil))
    }
}
