//
//  ProfileIconView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 30/07/24.
//

import SwiftUI

struct ProfileIconView: View {
    @State var searchText: String = "Em aberto"
    var statusHelp = ["Em aberto", "Concluídos"]
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack() {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .cornerRadius(45/2)
                    Text("Olá, User 1")
                }
                Spacer()
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .padding(.bottom, 25)
            SearchBarView()
                .padding(.bottom, 10)
            Picker("What is your favorite color?", selection: $searchText) {
                ForEach(statusHelp, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ProfileIconView()
}
