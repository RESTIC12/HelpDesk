//
//  HomeView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import SwiftUI

struct HomeView: View {
    var statusHelp = ["Em aberto", "Concluídos"]
    @Environment(\.dismiss) var dismiss
    @State var dismissView: Bool = false
    @State var showAlert = false
    @State var showNewChamadoView = false
    @State var searchText: String = ""
    @State var openHelpOrNotText: String = "Em aberto"
    @StateObject var viewModel = HomeViewModel(
            service: HelpServiceImp()
        )
    @State private var isShowingLoginView = false

    var body: some View {
        
        NavigationView {
            VStack {
                HeaderView(searchText: $searchText) {
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos", completion: {
                        showAlert = true
                    })
                } dismissUserView: {
                    isShowingLoginView = true
                }
                
                
                Picker("", selection: $openHelpOrNotText) {
                    ForEach(statusHelp, id: \.self) {
                        Text($0)
                    }
                }
                .onReceive([openHelpOrNotText].publisher.first(), perform: { _ in
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos", completion: {
                        showAlert = true
                    })
                })
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom, 15)
                .fullScreenCover(isPresented: $isShowingLoginView, content: {
                    LoginView()
                })
                
                let permissao = SessionManager.shared.currentUser?.permissao
                HStack {
                    Spacer()
                    if permissao == 0 {
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
                    }
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
                    viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos", completion: {
                        showAlert = true
                    })
                }
                .sheet(isPresented: $showNewChamadoView) {
                    NewChamadoView(
                        isPresented: $showNewChamadoView,
                        fetchHelps: {
                            viewModel.fetchChamados(filter: searchText, solucionado: openHelpOrNotText == "Concluídos", completion: {
                                showAlert = true
                            })
                        }
                    )
                }
                .padding()
                Spacer()
                
            }
            .background(Color.backGround)
        }
        .fullScreenCover(isPresented: $dismissView) {
            LoginView()
        }
        .alert("Ops!", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                showAlert = false
            }
        } message: {
            Text("Ocorreu um erro inesperado ao tentar obter os chamados.")
        }

    }
    
}

#Preview {
    HomeView(searchText: "")
}

