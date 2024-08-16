//
//  ChamadoDetailView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 30/07/24.
//

import SwiftUI

struct ChamadoDetailView: View {
    @State var showAlert = false
    var tituloChamado: String
    var descricaoChamado: String
    var solicitante: String
    var prioridade: String
    @StateObject var viewModel: ChamadoDetailViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(tituloChamado)
                    .font(.custom("Poppins-Medium", size: 26))
                    .padding(.top)
                
                
                HStack {
                    Text("Usuário solicitante:")
                        .font(.custom("Poppins-Medium", size: 16))
                    Text(solicitante)
                        .font(.custom("Poppins-light", size: 16))
                }
                .padding(.top, 40)
                
                HStack {
                    Text("Prioridade:")
                        .font(.custom("Poppins-medium", size: 16))
                    Text(prioridade)
                        .font(.custom("Poppins-light", size: 16))
                }
                Text("Descrição:")
                    .font(.custom("Poppins-medium", size: 16))
                
                HStack {
                    Text(descricaoChamado)
                        .font(.custom("Poppins-light", size: 16))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            .padding()
            
            
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    let permissao = SessionManager.shared.currentUser?.permissao
                    if (permissao == 1 || permissao == 2) && viewModel.help.details.solucionado == false {
                        Button(action: {
                            viewModel.updateHelp { success in
                                if !success {
                                    showAlert = true
                                }
                            }
                        }) {
                            Text("Encerrar Chamado")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.callMeDesk)
                                .cornerRadius(10)
                        }
                        .accessibilityLabel(Text("Encerrar chamado"))
                    }
                    
                    //                    Button(action: {
                    //                        print("chamado em andamento button clicked")
                    //                    }) {
                    //                        Text("Chamado em andamento")
                    //                            .foregroundColor(.black)
                    //                            .padding()
                    //                            .frame(maxWidth: .infinity)
                    //                            .background(Color.yellow)
                    //                            .cornerRadius(10)
                    //                    }
                    //                    .accessibilityLabel(Text("chamado em andamento"))
                }
                .padding([.leading, .trailing, .bottom])
            }
            .frame(maxWidth: .infinity)
            .alert("Ops!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    showAlert = false
                }
            } message: {
                Text("Ocorreu um erro inesperado ao tentar encerrar o chamado. Por favor, tente novamente mais tarde.")
            }
        }
        .background(Color.backGround)
    }
}

struct ChamadoDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChamadoDetailView(
            tituloChamado: "Chamado exemplo",
            descricaoChamado: "Esta é uma descrição de exemplo para o chamado. Inclui todos os detalhes relevantes que devem ser exibidos ao suporte.",
            solicitante: "Zezinho",
            prioridade: "Alta", viewModel: ChamadoDetailViewModel(help: HelpDesk(id: nil, uid: "", details: HelpRoot(solicitante: "", titulo: "", texto: "", departamento: "", prioridade: "", solucionado: false)))
        )
    }
}
