//
//  UserView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 13/08/24.
//

import SwiftUI
import FirebaseAuth

struct UserView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var dismissUserView: (() -> Void)
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                dismiss()
            } label: {
                HStack() {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.gray.opacity(0.8))
                        .padding(.trailing)
                }
            }
            
            
            
            Spacer()
            
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray.opacity(0.5))
            }
            .cornerRadius(50)
            
            Text(SessionManager.shared.currentUser?.nome ?? "Unknowm")
                .font(.custom("Poppins-light", size: 16))
            
            Spacer()
            
            
            Button {
                
            } label: {
                Text("Privacidade")
                    .font(.custom("Poppins-light", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.callMeDesk)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Enviar chamado"))
            .padding(.leading)
            .padding(.trailing)
            
            Button {
                
            } label: {
                Text("Sobre o Call Me Desk")
                    .font(.custom("Poppins-light", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.callMeDesk)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Enviar chamado"))
            .padding(.leading)
            .padding(.trailing)
            
            Button {
                logOut()
            } label: {
                Text("Fazer Logoff")
                    .font(.custom("Poppins-light", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.callMeDesk)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Enviar chamado"))
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
            
            
            Image("Nuvens")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backGround)
    }
    
    
    private func logOut() {
        do {
            try Auth.auth().signOut()
            SessionManager.shared.signOut()
            print("Usuário deslogado")
            dismiss()
            dismissUserView()
        } catch let error {
            print("Erro ao deslogar: \(error.localizedDescription)")
        }
    }

}

#Preview {
    UserView(dismissUserView: {})
}
