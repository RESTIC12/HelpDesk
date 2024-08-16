//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showNewChamadoView = false
    
    var body: some View {
        
        HeaderView(showNewChamadoView: $showNewChamadoView)
        
        ScrollView {
            
            CardView(tituloChamado: "Chamado 01",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Alta",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .red.opacity(0.8))
            
            CardView(tituloChamado: "Título Chamado",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Baixa",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .yellow.opacity(0.8))
            
            CardView(tituloChamado: "Título Chamado",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Média",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .orange.opacity(0.8))
        }
        .padding()
        
        Spacer()
        
        }
        .sheet(isPresented: $showNewChamadoView) {
            NewChamadoView(isPresented: $showNewChamadoView)
        }
    }
}

#Preview {
    HomeView()
}

