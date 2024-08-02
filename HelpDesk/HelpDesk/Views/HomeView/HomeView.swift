//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {
    @State var showNewChamadoView = false
    @State var searchText: String = ""
    @StateObject var viewModel = HomeViewModel (
        service: HelpServiceImp(
            networkClient: NetworkService(session: URLSession.shared),
            fromUrl: URL(string: "http://localhost:3000/help")!
        )
    )

    var body: some View {
        
        HeaderView(searchText: $searchText, showNewChamadoView: $showNewChamadoView) {
            viewModel.fetchChamados(filter: searchText)
        }
        
        ScrollView {
            ForEach(viewModel.helps, id: \.self) { call in
                CardView(
                    tituloChamado: call.help.titulo,
                    descricaoChamado: call.help.texto,
                    prioridadeChamado: call.help.prioridade,
                    departamentoChamado: "Departamento \(call.help.departamento)"
                )
            }
        }
        .onAppear() {
            viewModel.fetchChamados(filter: searchText)
        }
        .sheet(isPresented: $showNewChamadoView) {
            NewChamadoView(
                isPresented: $showNewChamadoView,
                fetchHelps: {
                    viewModel.fetchChamados(filter: searchText)
                }
            )
        }
        .padding()
        Spacer()
        
    }
    
}

#Preview {
    HomeView(searchText: "tsets")
}

