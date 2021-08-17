//
//  ProfileEntryView.swift
//  ProfileEntryView
//
//  Created by Tiago Lopes on 16/08/21.
//

import SwiftUI

struct ProfileEntryView: View {
    
    // MARK: Properties
    
    let entryImageName: String?
    let entryValue: String?
    
    // MARK: Initializer
    
    init(entryImageName: String? = nil, entryValue: String?) {
        self.entryImageName = entryImageName
        self.entryValue = entryValue
    }
    
    // MARK: Body
    
    var body: some View {
        if let entryValue = entryValue {
            HStack {
                if let imageName = entryImageName {
                    Image(systemName: imageName)
                }
                
                Text(entryValue)
                
                Spacer()
            }
            .multilineTextAlignment(.leading)
        } else {
            EmptyView()
        }
    }
}

// MARK: - Preview

struct ProfileEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntryView(entryImageName: "building.2", entryValue: "Brasília, Brazil")
    }
}
