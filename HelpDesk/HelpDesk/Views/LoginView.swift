//
//  LoginView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI
import Firebase
import UIKit

struct LoginView: View {
    @StateObject var sessionManager = SessionManager.shared
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""
    
    
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                
                VStack {
                    if isLoggedIn {
                        HomeView()
                    } else {
                        loginView
                    }
                }
                .padding()
            }
            .onReceive(sessionManager.$currentUser) { currentUser in
                isLoggedIn = currentUser != nil
            }
        }

    
    var loginView: some View {
            VStack {
                
                Image("imagerobot")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -20)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .accessibilityLabel(Text("Email"))


                SecureField("Senha", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 6)
                    .accessibilityLabel(Text("Senha"))
                

                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.top, 4)
                }
                
                Button(action: {
                    signIn()
                }) {
                    Text("Entrar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .accessibilityLabel(Text("Entrar"))
                .padding(.top)
                
                
                
                
                HStack(spacing:30) {
                    
                    Button("esqueci a senha"){
                        print("esqueci a senha clicked!")
                    }
                    
                    
                    Divider()
                        .background(.blue)
                    
                    Button("solicitar cadastro"){
                        print("fazer cadstro clicked!")
                    }
         
                }
                .foregroundColor(.white .opacity(0.8))
                .frame(height: 30)
                .padding(.top, 20)
                
                
                Spacer()
            }
            .padding()

    }
    
    private func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let notificationFeedback = UINotificationFeedbackGenerator()
                notificationFeedback.notificationOccurred(.error) // feedback tátil pro erro no login
                errorMessage = error.localizedDescription
                print(errorMessage)
            } else {
                if let user = authResult?.user {
                    sessionManager.signIn(withUser: User(uid: user.uid,
                                                         nome: "",
                                                         email: "",
                                                         permissao: 0
                    ))
                    let notificationFeedback = UINotificationFeedbackGenerator()
                    notificationFeedback.notificationOccurred(.success)
                    isLoggedIn = true
                    print("Usuário logado: \(user.uid)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

