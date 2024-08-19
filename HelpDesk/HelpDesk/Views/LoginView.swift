//
//  LoginView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//  Implemented by Josimar Ferreira
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject var sessionManager = SessionManager.shared
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var errorMessage = ""
    @State private var isShowingHomeView = false
    @State private var showForgetPsw = false
    @State private var showSignUp = false
    
    var body: some View {
        ZStack {
            Color("BackGround")
            loginView
                .padding()
        }
        .ignoresSafeArea()
        .onAppear {
            if sessionManager.currentUser == nil {
                isShowingHomeView = false
            }
        }
        .onReceive(sessionManager.$currentUser) { currentUser in
            isLoggedIn = currentUser != nil
            if isLoggedIn {
                isShowingHomeView = true
            }
        }
        .fullScreenCover(isPresented: $isShowingHomeView) {
            HomeView()
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
            
            TextField("", text: $email, prompt: Text("Digite seu email")
                .foregroundColor(.callMeDesk.opacity(0.5))
            )
            .font(.custom("Poppins-Regular", size: 12))
            .frame(height: 45)
            .cornerRadius(8.0)
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(.callMeDesk, lineWidth: 0.5))
            .accessibilityLabel(Text("Digite seu email"))
            .foregroundColor(.callMeDesk)
            .autocapitalization(.none)
            
            Text("Senha")
                .font(.custom("Poppins-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            HStack {
                
                SecureField("", text: $password, prompt: Text("Digite sua senha").foregroundColor(.callMeDesk.opacity(0.5))
                )
                .font(.custom("Poppins-Regular", size: 12))
                .frame(height: 45)
                .cornerRadius(8.0)
                .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.callMeDesk, lineWidth: 0.5))
                .accessibilityLabel(Text("Digite sua senha"))
                .foregroundColor(.callMeDesk)
            }
            
            
            Button("Esqueci minha senha"){
                showForgetPsw = true
            }
            .alert("Verifique seu e-mail", isPresented: $showForgetPsw, actions: {
                Button("Ok"){}
            })
            .font(.custom("Poppins-Medium", size: 12))
            .foregroundColor(.callMeDesk)
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 14))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, -50)
            }
            
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
                    showSignUp = true
                }
                .alert("Solicitação de acesso recebida!", isPresented: $showSignUp, actions: {
                    Button("Ok") {}
                })
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundColor(.callMeDesk)
                
            }.padding(.top, 5)
            
            Image("Nuvens")
                .padding(.top, 20)
            
        }
        .fullScreenCover(isPresented: $isShowingHomeView, content: {
            if isShowingHomeView && isLoggedIn {
                HomeView()
            }
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.callout)
                    .foregroundColor(.red)
                    .padding(.top, 4)
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

