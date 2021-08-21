//
//  DefaultProfileView.swift
//  DefaultProfileView
//
//  Created by Tiago Lopes on 15/08/21.
//

import SwiftUI

struct DefaultProfileView: View {
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.fill")
                .font(.system(size: 60))
            
            Text("Search a Github profile using a name or the user's identifier.")
        }
        .padding()
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
    }
}

// MARK: - Preview

struct DefaultProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultProfileView()
    }
}
