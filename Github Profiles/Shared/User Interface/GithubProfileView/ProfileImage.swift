//
//  ProfileImage.swift
//  ProfileImage
//
//  Created by Tiago Lopes on 21/08/21.
//

import SwiftUI

struct ProfileImage: View {
    
    // MARK: Properties
    
    private var isRunningInPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    let url: URL?
    
    // MARK: Body
    
    var body: some View {
        if isRunningInPreview {
            Image("octocat_image")
                .resizable()
                .aspectRatio(Constants.imageAspectRatio, contentMode: .fit)
                .clipShape(Circle())
                .frame(height: Constants.imageHeight)
        } else {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(Constants.imageAspectRatio, contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                LoadingIndicator()
            }
            .frame(height: Constants.imageHeight)
            .aspectRatio(Constants.imageAspectRatio, contentMode: .fit)
        }
    }
}

// MARK: Constants

private extension ProfileImage {
    enum Constants {
        static let imageAspectRatio: CGFloat = 1.0
        static let imageHeight: CGFloat = 200.0
    }
}

// MARK: - Preview

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(url: URL(string: "www.google.com")!)
    }
}
