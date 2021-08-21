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
                .aspectRatio(1, contentMode: .fit)
        } else {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .aspectRatio(1, contentMode: .fit)
            // TODO: Make the progress view and the image have the same size.
        }
    }
}

// MARK: - Preview

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(url: URL(string: "www.google.com")!)
    }
}
