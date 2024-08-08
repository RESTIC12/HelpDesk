//
//  LoginView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//  Implemented by Josimar Ferreira
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
    @State private var isShowingHomeView = false
    
    var body: some View {
        ZStack {
            Color("BackGround")
            loginView
                .padding()
        }
        .ignoresSafeArea()
        .onReceive(sessionManager.$currentUser) { currentUser in
            isLoggedIn = currentUser != nil
        }
    }
    
    
    var loginView: some View {
        
        VStack {
            
            Text("Call Me Desk")
                .font(.custom("Poppins-SemiBold", size: 42))
                .foregroundColor(.callMeDesk)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 85)
            
            Text("Log In")
                .font(.custom("Poppins-Regular", size: 32))
                .padding(.top, 10)
                .padding(.bottom, 5)
                            
            Text("Let's get to work")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.callMeDesk)
            
            Text("Email")
                .font(.custom("Poppins-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
            
            TextField("Digite seu email", text: $email)
                .font(.custom("Poppins-Regular", size: 12))
                .frame(height: 45)
                .cornerRadius(8.0)
                .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.callMeDesk, lineWidth: 0.5))
                .accessibilityLabel(Text("Digite seu email"))
                .foregroundColor(.callMeDesk)
                            
            Text("Senha")
                .font(.custom("Poppins-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            SecureField("Digite sua senha", text: $password)
                .font(.custom("Poppins-Regular", size: 12))
                .frame(height: 45)
                .cornerRadius(8.0)
                .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.callMeDesk, lineWidth: 0.5))
                .accessibilityLabel(Text("Digite sua senha"))
                .foregroundColor(.callMeDesk)
            
            Button("Esqueci minha senha"){
                //Solicitar NOVA senha
            }
            .font(.custom("Poppins-Medium", size: 12))
            .foregroundColor(.callMeDesk)
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            
            Button(action: {
                signIn()
            }) {
                Text("Login")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.callMeDesk)
                    .cornerRadius(10)
                    .font(.title3)
            }
            .accessibilityLabel(Text("Login"))
            .padding(.top, 50)
            
            HStack {
                
                Text("Não possui uma conta?")
                    .font(.custom("Poppins-Light", size: 12))
                    .foregroundColor(.callMeDesk)
                
                Button("Sign Up!"){
                    //Solicitar acesso
                }
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundColor(.callMeDesk)
                
            }.padding(.top, 5)
            
            Image("Nuvens")
                .padding(.top, 20)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.top, 4)
            }
            
        }
        .fullScreenCover(isPresented: $isShowingHomeView, content: {
            if isShowingHomeView && isLoggedIn {
                HomeView()
            }
        })
        .padding(15)
        
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
                    sessionManager.signIn(withUser: user.uid)
                    let notificationFeedback = UINotificationFeedbackGenerator()
                    notificationFeedback.notificationOccurred(.success)
                    isLoggedIn = true
                    isShowingHomeView = true
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

