//
//  HeaderView.swift
//  HelpDesk
//
//  Created by Joao Rocha on 30/07/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String
    var fetchHelps: (() -> Void)
    @State var isShowingUserView: Bool = false
    var dismissUserView: (() -> Void)

    var body: some View {
        VStack(alignment: .leading) {
            Button {
                print("user clicergd")
                isShowingUserView = true
            } label: {
                VStack() {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.gray.opacity(0.5))
                        .cornerRadius(45/2)
                    Text("Olá, \(SessionManager.shared.currentUser?.nome ?? "")")
                        .foregroundColor(.gray)
                        .font(.custom("Poppins-light", size: 12))
                }
                .padding(.leading)
            }
            SearchBarView(searchText: $searchText, fetchHelps: {
                fetchHelps()
            })
            .padding(.bottom, 10)
        }
        .fullScreenCover(isPresented: $isShowingUserView) {
            UserView(dismissUserView: dismissUserView)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(searchText: .constant("placeholder"), fetchHelps: {}, dismissUserView: {})
    }
}
