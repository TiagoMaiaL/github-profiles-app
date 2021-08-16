//
//  SearchBar.swift
//  SearchBar
//
//  Created by Tiago Lopes on 15/08/21.
//

import SwiftUI

struct SearchBar: View {
    
    // MARK: Properties
    
    @Binding
    var searchText: String
    
    let onSubmitAction: () -> Void
    
    // MARK: Body
    
    var body: some View {
        HStack {
            TextField("Search using a name or identifier", text: $searchText)
                .onSubmit {
                    onSubmitAction()
                }
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .background(.thickMaterial)
    }
}

// MARK: Preview

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        let searchText = Binding<String>(get: { "" }, set: { _ in })
        SearchBar(searchText: searchText) {}
    }
}
