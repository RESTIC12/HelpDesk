//
//  SearchBarView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 31/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var fetchHelps: () -> Void
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Pesquisar por chamado", text: $searchText)
                .onChange(of: searchText) {
                    fetchHelps()
                }
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .opacity(0.8)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background (
            RoundedRectangle(cornerRadius: 25)
                .fill(.background.opacity(0.8))
                .shadow(radius: 3)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), fetchHelps: {})
}
