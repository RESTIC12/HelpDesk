//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel (
        service: HelpServiceImp(
            networkClient: NetworkService(session: URLSession.shared),
            fromUrl: URL(string: "http://localhost:3000/help")!
        )
    )

    var body: some View {
        
        HeaderView()
        
        ScrollView {
            ForEach(viewModel.helps, id: \.self) { call in
                CardView(
                    tituloChamado: call.help.titulo,
                    descricaoChamado: call.help.texto,
                    prioridadeChamado: call.help.prioridade,
                    departamentoChamado: "Departamento \(call.help.departamento)",
                    corPrioridade: .red
                )
            }

//            
//            CardView(tituloChamado: "Título Chamado",
//                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
//                     prioridadeChamado: "Baixa",
//                     departamentoChamado: "Departamento Técnico",
//                     corPrioridade: .yellow)
//            
//            CardView(tituloChamado: "Título Chamado",
//                     descricaoChamado: "Descrição prévia do chamado, em poucas linhas. Este é um chamado teste",
//                     prioridadeChamado: "Média",
//                     departamentoChamado: "Departamento Técnico",
//                     corPrioridade: .orange)
        }
        .onAppear() {
            viewModel.fetchChamados()
        }
        .padding()
        Spacer()
        
    }
}

#Preview {
    HomeView()
}

