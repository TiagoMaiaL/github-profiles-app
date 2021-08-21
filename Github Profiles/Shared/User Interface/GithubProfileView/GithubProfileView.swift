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
        VStack(spacing: Constants.screenVerticalSpacing) {
            profileImage
            
            VStack {
                ProfileEntryView(entryValue: viewModel.name)
                    .font(.title)
                ProfileEntryView(entryValue: viewModel.bio)
                    .font(.callout)
            }
            .foregroundColor(.primary)
            
            VStack(spacing: Constants.verticalEntrySpacing) {
                ProfileEntryView(entryImageName: "building.2", entryValue: viewModel.company)
                ProfileEntryView(entryImageName: "location.north", entryValue: viewModel.location)
                ProfileEntryView(entryImageName: "link", entryValue: viewModel.blog)
            }
            .font(.callout)
            .foregroundColor(.secondary)
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

// MARK: Constants

private extension GithubProfileView {
    enum Constants {
        static let screenVerticalSpacing: CGFloat = 15.0
        static let verticalEntrySpacing: CGFloat = 5.0
    }
}

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
        
        GithubProfileView(viewModel: GithubProfileViewModel(user: user, repositories: []))
    }
}
