//
//  ErrorView.swift
//  ErrorView
//
//  Created by Tiago Lopes on 15/08/21.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    
    let systemImageName: String
    let title: String
    let message: String
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            Image(systemName: systemImageName)
                .font(Constants.imageFont)
            
            Text(title)
                .font(.headline)
            
            Text(message)
        }
        .padding()
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
    }
}

// MARK: Constants

private extension ErrorView {
    enum Constants {
        static let verticalSpacing: CGFloat = 10.0
        static let imageFont = Font.system(size: 60)
    }
}

// MARK: Instances

extension ErrorView {
    static func connectionError() -> ErrorView {
        ErrorView(
            systemImageName: "wifi.exclamationmark",
            title: "Error",
            message: "An error has occurred. Please, check your internet connection and try again."
        )
    }
    
    static func profileNotFound() -> ErrorView {
        ErrorView(
            systemImageName: "person.fill.xmark",
            title: "Profile not found",
            message: "Try searching for a different name or identifier."
        )
    }
}

// MARK: - Preview

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView.connectionError()
        ErrorView.profileNotFound()
    }
}
