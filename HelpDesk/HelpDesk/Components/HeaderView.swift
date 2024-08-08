//
//  HeaderView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 30/07/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String
    @Binding var showNewChamadoView: Bool
    var fetchHelps: (() -> Void)
    
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
                        Text("Olá, \(SessionManager.shared.currentUser?.nome ?? "Unknowm")")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                let permissao = SessionManager.shared.currentUser?.permissao
                if permissao == 0 {
                    Button {
                        showNewChamadoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(.blue.opacity(0.8))
                            .frame(width: 35, height: 35)
                    }
                }
            }
            .padding(.bottom, 25)
            SearchBarView(searchText: $searchText, fetchHelps: {
                fetchHelps()
            })
            .padding(.bottom, 10)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(searchText: .constant("placeholder"), showNewChamadoView: .constant(false), fetchHelps: {})
    }
}
