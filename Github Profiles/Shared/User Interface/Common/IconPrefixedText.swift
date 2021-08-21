//
//  IconPrefixedText.swift
//  IconPrefixedText
//
//  Created by Tiago Lopes on 16/08/21.
//

import SwiftUI

struct IconPrefixedText: View {
    
    // MARK: Properties
    
    let iconName: String
    let label: String
    
    // MARK: Initializer
    
    init(iconName: String, label: String) {
        self.iconName = iconName
        self.label = label
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(label)
            Spacer()
        }
        .multilineTextAlignment(.leading)
    }
}

// MARK: - Preview

struct IconLabelView_Previews: PreviewProvider {
    static var previews: some View {
        IconPrefixedText(iconName: "building.2", label: "Brasília, Brazil")
    }
}
