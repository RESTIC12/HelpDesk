//
// SettingsView.swift
// HelpDesk
//
// Created by Larissa Martins Correa on 30/07/24.
//

import SwiftUI

struct SettingsView: View {

    let settingsOptions = ["Notificações", "Segurança", "Privacidade", "Conta", "Sobre o App"]

    @State private var showLogoutAlert = false
    @State private var showDeleteAccountAlert = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {

                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Configurações")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 40)

                        Text("Gerencie suas preferências e configurações de conta.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 25)
                        
                    }
                    .padding(.horizontal)
                    Image("cloud")
                        .resizable()
                        .frame(width: 80, height: 60)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 30)
                    
                }

                List {
                    ForEach(settingsOptions, id: \.self) { option in
                        NavigationLink(destination: destinationView(for: option)) {
                            Text(option)
                                .fontWeight(.semibold)
                        }
                    }
                }

                HStack(spacing: 20) {
                    Button(action: {
                        showLogoutAlert = true
                    }) {
                        Text("Encerrar a sessão")
                            .frame(width: 160, height: 50)
                            .background(Color.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .bold()
                    }
                    .alert(isPresented: $showLogoutAlert) {
                        Alert(
                            title: Text("Encerrar Sessão"),
                            message: Text("Você tem certeza de que deseja encerrar a sessão?"),
                            primaryButton: .destructive(Text("Encerrar")) {
                                // Ação para encerrar a sessão
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }

                    Button(action: {
                        showDeleteAccountAlert = true
                    }) {
                        Text("Excluir a conta")
                            .frame(width: 160, height: 50)
                            .background(Color.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .bold()
                    }
                    .alert(isPresented: $showDeleteAccountAlert) {
                        Alert(
                            title: Text("Excluir Conta"),
                            message: Text("Você tem certeza de que deseja excluir a conta? Esta ação é irreversível."),
                            primaryButton: .destructive(Text("Excluir")) {
                                // Ação para excluir a conta
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
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
        case "Privacidade":
            PrivacidadeView()
        case "Conta":
            UserProfileView()
        case "Sobre o App":
            AboutView()
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

struct AccountView: View {
    var body: some View {
        Text("Configurações de Conta")
    }
}

#Preview {
    SettingsView()
}
