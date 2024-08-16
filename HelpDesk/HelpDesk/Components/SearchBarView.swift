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
                .foregroundColor(.gray.opacity(1))
            TextField("Buscar Tickets", text: $searchText)
                .onChange(of: searchText) {
                    fetchHelps()
                }
                .overlay (
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray.opacity(1))
                        .padding()
                        .offset(x: 10)
                        .opacity(0.8)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.custom("Poppins-light", size: 14))
        .padding()
        .background (
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.2))
                .frame(height: 40)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), fetchHelps: {})
}
