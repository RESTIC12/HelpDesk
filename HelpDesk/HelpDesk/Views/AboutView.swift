//
//  AboutView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 17/08/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("SOBRE O HELPDESK")
                    .font(.custom("Poppins-Regular", size: 20))
                
                Text("O HelpDesk é um aplicativo desenvolvido com o objetivo de melhorar e facilitar a gestão de chamados dentro da empresa. Com uma interface intuitiva e funcionalidades robustas, ele permite que os colaboradores criem, acompanhem e solucionem chamados de maneira eficiente e organizada. Através do HelpDesk, as equipes podem priorizar demandas, monitorar o progresso e garantir que as solicitações sejam atendidas em tempo hábil, contribuindo para a produtividade e a satisfação dos usuários finais.")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.text.opacity(0.6))
            }
            .padding()
            
            
            VStack(alignment: .leading, spacing: 16) {
                Text("QUEM DESENVOLVEU O HELPDESK?")
                    .font(.custom("Poppins-Regular", size: 20))
                
                Text("O HelpDesk foi desenvolvido por um time de alunos da residência em desenvolvimento iOS: Victor Brigido, João Matheus, Íkaro, Josimar, Larissa e Gabriel Palhano. Este grupo uniu forças para criar uma solução que atende às necessidades modernas de gestão de chamados, aplicando as melhores práticas de design e desenvolvimento mobile.")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.text.opacity(0.6))
            }
            .padding()
            
            ScrollView{
                CardPersonView(name: "Victor Brigido", description: "Desenvovedor IOS", imageName: "victorimage", description2: "IRede", linkLinkedin: "https://www.linkedin.com/in/victor-brigido-7b0473144")
                
                CardPersonView(name: "Gabriel Palhano", description: "UX/UI Design", imageName: "gabrielimage", description2: "IRede", linkLinkedin: "https://www.linkedin.com/in/gabrielpalhano/")
                
                CardPersonView(name: "João Matheus", description: "Desenvovedor IOS", imageName: "joaoimage", description2: "IRede / Invillia", linkLinkedin: "https://www.linkedin.com/in/joao-matheus-a059581a2/")
                
                CardPersonView(name: "Josimar Ferreira", description: "Desenvovedor IOS", imageName: "josimarimage", description2: "IRede", linkLinkedin: "https://www.linkedin.com/in/josimar-ferreira-7979b0176/")
                
                CardPersonView(name: "Larissa Correa", description: "Desenvovedor IOS", imageName: "larissaimage", description2: "IRede", linkLinkedin: "https://www.linkedin.com/in/larimscorrea/")
                
                CardPersonView(name: "Ikaro", description: "UX/UI Design", imageName: "ikaroimage", description2: "IRede", linkLinkedin: "https://www.linkedin.com/in/larimscorrea/")
            }
            .scrollIndicators(.never)
        }
        .background(Color.backGround)
    }
}

#Preview {
    AboutView()
}
