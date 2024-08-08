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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(tituloChamado)
                    .font(.headline)
                    .accessibilityLabel(Text("\(tituloChamado)"))
                
                Spacer()
                
                Text(prioridadeChamado)
                    .font(.caption)
                    .padding(6)
                    .background(
                        Capsule()
                            .fill(corPrioridade(prioridade: prioridadeChamado).opacity(0.8))
                            .frame(width: 60, height: 26)
                    )
                    .accessibilityLabel(Text("\(prioridadeChamado)"))
                
            }
            .padding(.trailing)
            
            Text(descricaoChamado)
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.6))
                .multilineTextAlignment(.leading)
                .accessibilityLabel(Text("\(descricaoChamado)"))
            
            HStack {
                Text(departamentoChamado)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .accessibilityLabel(Text("\(departamentoChamado)"))
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 142)
        .cornerRadius(8.0)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 0.6)
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
        tituloChamado: "Título do Chamado",
        descricaoChamado: "Testando Chamado 1936",
        prioridadeChamado: "Média",
        departamentoChamado: "Departamento Técnico"
    )
}

