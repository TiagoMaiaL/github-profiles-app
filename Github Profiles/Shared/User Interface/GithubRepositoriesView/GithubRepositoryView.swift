//
//  GithubRepositoryView.swift
//  GithubRepositoryView
//
//  Created by Tiago Lopes on 20/08/21.
//

import SwiftUI

struct GithubRepositoryView: View {
    
    // MARK: Properties
    
    private let viewModel: GithubRepositoryViewModel
    
    // MARK: Initializers
    
    init(viewModel: GithubRepositoryViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: Constants.bodyVerticalSpace) {
            leadingText(viewModel.name)
                .font(.headline)
            
            if let description = viewModel.description {
                leadingText(description)
            }
            
            metadataFooterView
        }
    }
    
    private var metadataFooterView: some View {
        HStack(spacing: Constants.footerHorizontalSpace) {
            metadataEntryView(
                withImage: "star",
                andText: viewModel.starsCount
            )
            
            metadataEntryView(
                withImage: "eye",
                andText: viewModel.watchersCount
            )
            
            metadataEntryView(
                withImage: "arrow.triangle.branch",
                andText: viewModel.forksCount
            )
            
            if let language = viewModel.programmingLanguage {
                Text(language)
            }
            
            Spacer()
        }
        .font(.footnote)
        .foregroundColor(.secondary)
    }
    
    private func metadataEntryView(
        withImage imageName: String,
        andText valueText: String
    ) -> some View {
        HStack(spacing: Constants.entryHorizontalSpace) {
            Image(systemName: imageName)
            Text(valueText)
        }
    }
    
    private func leadingText(_ text: String) -> some View {
        HStack {
            Text(text)
            Spacer()
        }
    }
}

// MARK: Constants

private extension GithubRepositoryView {
    enum Constants {
        static let bodyVerticalSpace = 10.0
        static let footerHorizontalSpace = 15.0
        static let entryHorizontalSpace = 5.0
    }
}

// MARK: - Preview

struct GithubRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        let model = GithubRepository(
            id: 1,
            name: "Repository name",
            description: "The preview of an amazing repository.",
            stars: 23,
            watchers: 1, forks: 0,
            language: "Swift"
        )
        let viewModel = GithubRepositoryViewModel(repository: model)
        
        GithubRepositoryView(viewModel: viewModel)
            .padding()
    }
}
