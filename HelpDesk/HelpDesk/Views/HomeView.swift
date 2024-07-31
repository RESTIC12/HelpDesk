//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        HeaderView()
        
        ScrollView{
            CardView(tituloChamado: "Chamado 01",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Alta",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .red)
            
            CardView(tituloChamado: "Título Chamado",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Baixa",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .yellow)
            
            CardView(tituloChamado: "Título Chamado",
                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
                     prioridadeChamado: "Média",
                     departamentoChamado: "Departamento Técnico",
                     corPrioridade: .orange)
        }
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    HomeView()
}

