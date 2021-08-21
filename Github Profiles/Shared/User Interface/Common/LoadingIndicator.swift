//
//  LoadingIndicator.swift
//  LoadingIndicator
//
//  Created by Tiago Lopes on 21/08/21.
//

import SwiftUI

struct LoadingIndicator: View {
    
    // MARK: Properties
    
    private var circular: some ProgressViewStyle {
        CircularProgressViewStyle(tint: Color.appTheme)
    }
    
    // MARK: Body
    
    var body: some View {
        ProgressView()
            .progressViewStyle(circular)
    }
}

// MARK: - Preview

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
