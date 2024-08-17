//
//  CardView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 30/07/24.
//

import SwiftUI

struct CardView: View {
    var tituloChamado: String
    var descricaoChamado: String
    var prioridadeChamado: String
    var departamentoChamado: String
    var solicitanteChamado: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            HStack(alignment: .center) {
                Image(systemName: "tag.fill")
                    .font(.system(size: 6))
                    .foregroundColor(.callMeDesk)
                Text("ID / 0001")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            .padding(.top, -12)
        

                Text(tituloChamado)
                    .font(.custom("Poppins-Medium", size: 16))
                    .accessibilityLabel(Text("\(tituloChamado)"))
                    .foregroundColor(.text)
       
                Text(descricaoChamado)
                    .font(.custom("Poppins-light", size: 12))
                    .multilineTextAlignment(.leading)
                    .accessibilityLabel(Text("\(descricaoChamado)"))
                    .padding(.top, -2)
                    .foregroundColor(.text)
            
            HStack(spacing: 20) {
                
                
                VStack(alignment: .leading) {
                    Text("Owner")
                        .font(.custom("Poppins", size: 8))
                        .foregroundColor(.secondary)
                    
                    Text(solicitanteChamado)
                        .font(.custom("Poppins-light", size: 8))
                        .foregroundColor(.text)
                    .accessibilityLabel(Text("\(solicitanteChamado)"))
                }
                
                
                VStack(alignment: .leading) {
                    Text("Departament")
                        .font(.custom("Poppins", size: 8))
                        .foregroundColor(.secondary)
                    
                    Text(departamentoChamado)
                        .font(.custom("Poppins-light", size: 8))
                        .foregroundColor(.text)
                    .accessibilityLabel(Text("\(departamentoChamado)"))
                }
                
                Spacer()
                
                Text(prioridadeChamado)
                    .font(.custom("Poppins-light", size: 10))
                    .padding(6)
                    .background(
                        Capsule()
                            .fill(corPrioridade(prioridade: prioridadeChamado).opacity(0.7))
                            .frame(width: 50, height: 22)
                    )
                    .foregroundColor(.text)
                    .accessibilityLabel(Text("\(prioridadeChamado)"))
            }
            .padding(.bottom, -12)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 152)
        .cornerRadius(8.0)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue.opacity(0.4), lineWidth: 0.8)
        )
    }
    
    func corPrioridade(prioridade: String) -> Color {
        switch prioridade.lowercased() {
        case "alta":
            return .red
        case "média", "media":
            return .orange
        case "baixa":
            return .gray
        default:
            return .gray
        }
    }
}

#Preview {
    CardView(
        tituloChamado: "Esqueci a senha do meu MAC",
        descricaoChamado: "Escrevi minhas credenciais de login em um papel, guardei mas esqueci onde e agora esqueci minha senha, consegue me ajudar?",
        prioridadeChamado: "Média",
        departamentoChamado: "TI",
        solicitanteChamado: "Alex"
    )
}

