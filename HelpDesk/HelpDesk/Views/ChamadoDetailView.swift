//
//  ChamadoDetailView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 30/07/24.
//

import SwiftUI

import SwiftUI

struct ChamadoDetailView: View {
    var tituloChamado: String
    var descricaoChamado: String
    var solicitante: String
    var prioridade: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(tituloChamado)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                HStack {
                    Text("Usuário solicitante:")
                        .font(.headline)
                    
                    Text(solicitante)
                }
                .padding(.top, 40)
                
                HStack {
                    Text("Prioridade:")
                        .font(.headline)
                    
                    Text(prioridade)
                }
               
                
                                
                Text("Descrição:")
                    .font(.headline)
                    

                Text(descricaoChamado)
                    .font(.body)
                    
                
                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                
                
                VStack(spacing: 20) {
                    Button(action: {
                        print("encerrar chamado button clicked")
                    }) {
                        Text("Encerrar Chamado")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(10)
                    }
                    .accessibilityLabel(Text("Encerrar chamado"))
                    
                    
                    
                    Button(action: {
                        print("chamado em andamento button clicked")
                    }) {
                        Text("Chamado em andamento")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    .accessibilityLabel(Text("chamado em andamento"))
                }
                .padding([.leading, .trailing, .bottom])
            }
        }
    }
}

struct ChamadoDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChamadoDetailView(
            tituloChamado: "Chamado exemplo",
            descricaoChamado: "Esta é uma descrição de exemplo para o chamado. Inclui todos os detalhes relevantes que devem ser exibidos ao suporte.",
            solicitante: "Zezinho",
            prioridade: "Alta"
        )
    }
}
