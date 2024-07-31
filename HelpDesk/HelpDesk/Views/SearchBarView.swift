//
//  SearchBarView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 31/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Pesquisar por chamado", text: $searchText)
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
                .shadow(radius: 8)
        )
        .padding()
    }
}

#Preview {
    SearchBarView()
}
