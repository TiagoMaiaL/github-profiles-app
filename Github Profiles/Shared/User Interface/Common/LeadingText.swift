//
//  LeadingText.swift
//  LeadingText
//
//  Created by Tiago Lopes on 21/08/21.
//

import SwiftUI

struct LeadingText: View {
    
    // MARK: Properties
    
    let label: String
    
    // MARK: Initializer
    
    init(_ label: String) {
        self.label = label
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
        }
    }
}

// MARK: - Preview

struct LeadingText_Previews: PreviewProvider {
    static var previews: some View {
        LeadingText("Testing preview")
    }
}
