//
//  NewChamadoView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 29/07/24.
//

import SwiftUI

struct NewChamadoView: View {
    
    @State private var showAlert: Bool = false
    @State private var showAlertMessage: String = ""
    @State private var tituloChamado: String = ""
    @State private var descricaoChamado: String = ""
    @State private var selectedDepartment: String = "RH"
    @State private var selectedpriority: String = "Baixa"
    @Binding var isPresented: Bool
    @StateObject var viewModel = NewChamadoViewModel(
            service: HelpServiceImp()
        )
    
    let priority = ["Baixa", "Media", "Alta"]
    let departments = ["RH", "TI"]
    var fetchHelps: (() -> Void)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
                Form {
                    Section(header: Text("Título *")) {
                        TextField("Digite o título do chamado", text: $tituloChamado)
                    }
                    .font(.custom("Poppins-light", size: 12))
                    Section(header: Text("Descrição *")) {
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
                    .font(.custom("Poppins-light", size: 12))
                    
                    Section(header: Text("Detalhes do Chamado")) {
                        HStack {
                            Picker("Departamento:", selection: $selectedDepartment) {
                                ForEach(departments, id: \.self) { department in
                                    Text(department).tag(department)
                                        .font(.subheadline)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .font(.custom("Poppins-light", size: 14))
                        }
                    }
                    .font(.custom("Poppins-light", size: 12))
                    
                    
                    Section(header: Text("Prioridade do Chamado")) {
                        HStack {
                            Picker("Prioridade:", selection: $selectedpriority) {
                                ForEach(priority, id: \.self) { priority in
                                    Text(priority).tag(priority)
                                        .font(.subheadline)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .font(.custom("Poppins-light", size: 14))
                        }
                    }
                    .font(.custom("Poppins-light", size: 12))
            }
            .background(Color.gray.opacity(0.11))
            
            Button(action: {
                if tituloChamado.isEmpty { return }
                if descricaoChamado.isEmpty { return }
                viewModel.createChamado(
                    help: HelpDesk(
                        id: nil,
                        uid: SessionManager.shared.currentUser?.uid ?? "userID",
                        details: HelpRoot(
                            solicitante: SessionManager.shared.currentUser?.nome ?? "Unknown",
                            titulo: tituloChamado,
                            texto: descricaoChamado,
                            departamento: selectedDepartment,
                            prioridade: selectedpriority,
                            solucionado: false
                        )),
                    completion: { success in
                        if success {
                            isPresented = false
                            fetchHelps()
                            return
                        }
                        showAlert = true
                        showAlertMessage = "Ocorreu um erro inesperado. Tente novamente, por favor."
                    }
                )
                
            }) {
                Text("Enviar chamado")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.callMeDesk)
                    .cornerRadius(10)
            }
            .accessibilityLabel(Text("Enviar chamado"))
            .padding()
            
        }
        .alert("Ops!", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                showAlert = false
            }
        } message: {
            Text(showAlertMessage)
        }

    }
}

#Preview {
    NewChamadoView(isPresented: .constant(true), fetchHelps: { })
}
