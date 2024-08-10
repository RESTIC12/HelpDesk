//
// SettingsView.swift
// HelpDesk
//
// Created by Larissa Martins Correa on 30/07/24.
//

import SwiftUI

struct SettingsView: View {
    
    let settingsOptions = ["Notificações", "Segurança", "Privacidade", "Aparência", "Conta", "Sobre o App"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Configurações")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    
                    Text("Gerencie suas preferências e configurações de conta.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }.padding(.horizontal)
                
                List {
                    ForEach(settingsOptions, id: \.self) { option in
                        NavigationLink(
                            destination: destinationView(for: option)) {
                                Text(option)
                                    .fontWeight(.semibold)
                            }
                    }
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Ação para encerrar a sessão
                    }) {
                        Text("Encerrar a sessão")
                            .frame(width: 160, height: 50)
                            .background(Color.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .bold()
                    }
                    
                    Button(action: {
                        // Ação para excluir a conta
                    }) {
                        Text("Excluir a conta")
                            .frame(width: 160, height: 50)
                            .background(Color.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .bold()
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    private func destinationView(for option: String) -> some View {
        switch option {
        case "Notificações":
            NotificationsView()
        case "Segurança":
            SecurityView()
        case "Privacidade":
            PrivacyView()
        case "Aparência":
            AppearanceView()
        case "Conta":
            AccountView()
        case "Sobre o App":
            AboutAppView()
        default:
            EmptyView()
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Configurações de Notificações")
    }
}

struct SecurityView: View {
    var body: some View {
        Text("Configurações de Segurança")
    }
}

struct PrivacyView: View {
    var body: some View {
        Text("Configurações de Privacidade")
    }
}

struct AppearanceView: View {
    var body: some View {
        Text("Configurações de Aparência")
    }
}

struct AccountView: View {
    var body: some View {
        Text("Configurações de Conta")
    }
}

struct AboutAppView: View {
    var body: some View {
        Text("Informações Sobre o App")
    }
}

#Preview {
    SettingsView()
}

