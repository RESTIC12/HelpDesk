//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {
    var statusHelp = ["Em aberto", "Concluídos"]
    @State var showNewChamadoView = false
    @State var searchText: String = ""
    @State var openHelpOrNotText: String = "Em aberto"
    @StateObject var viewModel = HomeViewModel (
        service: HelpServiceImp(
            networkClient: NetworkService(session: URLSession.shared),
            fromUrl: URL(string: "http://localhost:3000/help")!
        )
    )

    var body: some View {
        
        NavigationView {
            VStack {
                HeaderView(searchText: $searchText) {
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos")
                }
                
                Picker("", selection: $openHelpOrNotText) {
                    ForEach(statusHelp, id: \.self) {
                        Text($0)
                    }
                }
                .onReceive([openHelpOrNotText].publisher.first(), perform: { _ in
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos")
                })
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom, 15)
                let permissao = SessionManager.shared.currentUser?.permissao
                HStack {
                    Spacer()
//                    if permissao == 0 {
                        Button {
                            showNewChamadoView.toggle()
                        } label: {
                            Label("Novo ticket", systemImage: "plus")
                                .padding()
                                .foregroundStyle(.white)
                        }
                        .frame(height: 35)
                        .background(Color(hex: "#44C4FC"))
                        .cornerRadius(12)
//                    }
                }
                .padding(.horizontal, 20)
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.helps, id: \.self) { call in
                        NavigationLink(destination: ChamadoDetailView(
                            tituloChamado: call.details.titulo,
                            descricaoChamado: call.details.texto,
                            solicitante: call.details.solicitante,
                            prioridade: call.details.prioridade,
                            viewModel: ChamadoDetailViewModel(help: call)
                        )) {
                            CardView(
                                tituloChamado: call.details.titulo,
                                descricaoChamado: call.details.texto,
                                prioridadeChamado: call.details.prioridade,
                                departamentoChamado: "Departamento \(call.details.departamento)", 
                                solicitanteChamado: call.details.solicitante
                            )
                        }
                        .foregroundColor(.black)
                    }
                }
                .onAppear() {
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos")
                }
                .sheet(isPresented: $showNewChamadoView) {
                    NewChamadoView(
                        isPresented: $showNewChamadoView,
                        fetchHelps: {
                            viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos")
                        }
                    )
                }
                .padding()
                Spacer()
                
            }
        }
    }
    
}

#Preview {
    HomeView(searchText: "")
}

