//
//  ConnectionErrorView.swift
//  ConnectionErrorView
//
//  Created by Tiago Lopes on 15/08/21.
//

import SwiftUI

struct ConnectionErrorView: View {
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 60))
            
            Text("Error")
                .font(.headline)
            
            Text("An error has occurred. Please, check your internet connection and try again.")
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

// MARK: - Preview

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionErrorView()
    }
}
