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
    var corPrioridade: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(tituloChamado)
                    .font(.headline)
                
                Spacer()
                
                Text(prioridadeChamado)
                    .font(.caption)
                    .padding(6)
                    .background(
                        Capsule()
                            .fill(corPrioridade.opacity(0.8))
                            .frame(width: 60, height: 26)
                    )

            }
            .padding(.trailing)
            
            Text(descricaoChamado)
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.6))
                .multilineTextAlignment(.leading)
            
            HStack {
                Text(departamentoChamado)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
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
}

#Preview {
    CardView(
        tituloChamado: "Título do Chamado",
        descricaoChamado: "Testando Chamado 1936",
        prioridadeChamado: "Média",
        departamentoChamado: "Departamento Técnico",
        corPrioridade: .orange
    )
}

