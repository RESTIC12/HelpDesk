//
//  NewChamadoView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 29/07/24.
//

import SwiftUI

struct NewChamadoView: View {
    
    @State private var tituloChamado: String = ""
    @State private var descricaoChamado: String = ""
    @State private var selectedDepartment: String = ""
    @State private var selectedpriority: String = ""
    @Binding var isPresented: Bool
    @StateObject var viewModel = NewChamadoViewModel(
        service: HelpServiceImp(
            networkClient: NetworkService(session: URLSession.shared),
            fromUrl: URL(string: "http://localhost:3000/")!
        )
    )
    
    let priority = ["Baixa", "Media", "Alta"]
    let departments = ["RH", "TI"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack(){
                Text("Novo chamado")
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Form {
                    Section(header: Text("Título")) {
                        TextField("Digite o título do chamado", text: $tituloChamado)
                    }
                    Section(header: Text("Descrição")) {
                        ZStack(alignment: .topLeading) {
                            if descricaoChamado.isEmpty {
                                Text("Descreva seu chamado")
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                            TextEditor(text: $descricaoChamado)
                                .frame(height: 220)
                                .padding(.top, -8)
                                .padding(.leading, -4)
                        }
                    }
                    
                    Section(header: Text("Detalhes do Chamado")) {
                        HStack {
                            Picker("Departamento:", selection: $selectedDepartment) {
                                ForEach(departments, id: \.self) { department in
                                    Text(department).tag(department)
                                        .font(.subheadline)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    
                    Section(header: Text("Prioridade do Chamado")) {
                        HStack {
                            Picker("Prioridade:", selection: $selectedpriority) {
                                ForEach(priority, id: \.self) { priority in
                                    Text(priority).tag(priority)
                                        .font(.subheadline)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                }
            }
            .background(Color.gray.opacity(0.11))
            
            Button(action: {
                print("enviar chamado button clicked")
                viewModel.createChamado(
                    help: HelpDesk(
                        id: nil,
                        uid: SessionManager.shared.currentUser?.uid ?? "userID",
                        help: HelpRoot(
                            solicitante: SessionManager.shared.currentUser?.nome ?? "Unknown",
                            titulo: tituloChamado,
                            texto: descricaoChamado,
                            departamento: selectedDepartment,
                            prioridade: selectedpriority,
                            solucionado: false
                        ))
                )
                isPresented = false
            }) {
                Text("Enviar chamado")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Enviar chamado"))
            .padding()
            
        }
    }
}

#Preview {
    NewChamadoView(isPresented: .constant(true))
}
