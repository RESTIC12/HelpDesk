//
//  AskedQuestionsView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 13/08/24.
//


import SwiftUI



struct AskedQuestionsView: View {
    


    
    let faq = ["Login e Acesso", "Problemas Técnicos", "Uso do Aplicativo", "Configurações e Personalizações", "Pagamentos e Assinaturas", "Privacidade e Segurança", "Integrações", "Suporte e Contato", "FAQs Gerais"]

    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .accessibilityLabel("User Profile Image")
                
                Text("Hello")
                    .font(.headline)
                Spacer()
                
                Image("cloud")
                    .resizable()
                    .frame(width: 80, height: 60)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 30)
            
            VStack {
                Text("Perguntas Frequentes(FAQs)")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: .infinity)
    
            }
                
                
        }
        Spacer()
            
            List {
                
                ForEach(faq, id: \.self) { product in
                    NavigationLink(
                        destination: ConfigsView()) {
                            Text(product)
                            
                            
                        }
                }
            }
        
    
            
        
            
        }
        
    }





#Preview {

    AskedQuestionsView()

}
