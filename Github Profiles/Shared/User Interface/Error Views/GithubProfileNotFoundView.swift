//
//  GithubProfileNotFoundView.swift
//  GithubProfileNotFoundView
//
//  Created by Tiago Lopes on 15/08/21.
//

import SwiftUI

struct GithubProfileNotFoundView: View {
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            Image(systemName: "person.fill.xmark")
                .font(Constants.imageFont)
            
            Text("Profile not found")
                .font(.headline)
            
            Text("Try searching for a different name or identifier.")
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

// MARK: Constants

private extension GithubProfileNotFoundView {
    enum Constants {
        static let verticalSpacing: CGFloat = 10.0
        static let imageFont = Font.system(size: 60)
    }
}

// MARK: - Preview

struct GithubProfileNotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfileNotFoundView()
    }
}
