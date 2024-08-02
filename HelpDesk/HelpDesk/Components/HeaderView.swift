//
//  HeaderView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 30/07/24.
//

import SwiftUI

struct HeaderView: View {
    @State var searchText: String = "Em aberto"
    var statusHelp = ["Em aberto", "Concluídos"]
    @Binding var showNewChamadoView: Bool
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Button {
                    print("user clicked")
                } label: {
                    VStack() {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray.opacity(0.5))
                            .cornerRadius(45/2)
                        Text("Olá, User 1")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    showNewChamadoView.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.blue.opacity(0.8))
                        .frame(width: 35, height: 35)
                }
                

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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showNewChamadoView: .constant(false))
    }
}
