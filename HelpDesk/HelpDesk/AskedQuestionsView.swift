//
//  AskedQuestionsView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 13/08/24.
//


import SwiftUI

struct AskedQuestionsView: View {
    let faq = [
        "Login e Acesso",
        "Problemas Técnicos",
        "Uso do Aplicativo",
        "Configurações e Personalizações",
        "Pagamentos e Assinaturas",
        "Privacidade e Segurança",
        "Integrações",
        "Suporte e Contato",
        "FAQs Gerais"
    ]
    
    let faqDetails: [String: [String]] = [
        "Login e Acesso": [
            "Como posso redefinir minha senha?",
            "Esqueci meu nome de usuário, como posso recuperá-lo?",
            "Por que não consigo fazer login?"
        ],
        "Problemas Técnicos": [
            "O aplicativo está lento, o que posso fazer?",
            "Por que estou recebendo uma mensagem de erro?",
            "Como resolver problemas de conexão?"
        ],
        "Uso do Aplicativo": [
            "Como faço para abrir um novo ticket de suporte?",
            "Posso anexar arquivos ao meu ticket?",
            "Como faço para acompanhar o status do meu ticket?"
        ],
        "Configurações e Personalizações": [
            "Como posso alterar minhas preferências de notificação?",
            "Como editar minhas informações de perfil?",
            "Posso configurar alertas automáticos para determinados tipos de tickets?"
        ],
        "Pagamentos e Assinaturas": [
            "Como faço para atualizar minhas informações de pagamento?",
            "Quais são as opções de assinatura disponíveis?",
            "Como posso cancelar minha assinatura?"
        ],
        "Privacidade e Segurança": [
            "Como meus dados são protegidos?",
            "O que devo fazer se suspeitar que minha conta foi comprometida?",
            "Como posso excluir minha conta e dados pessoais?"
        ],
        "Integrações": [
            "Como posso integrar o aplicativo com outros serviços que uso?",
            "Quais integrações estão disponíveis?",
            "Como posso configurar uma integração?"
        ],
        "Suporte e Contato": [
            "Como entro em contato com o suporte?",
            "Qual é o tempo de resposta do suporte?",
            "Como posso fornecer feedback sobre o serviço?"
        ],
        "FAQs Gerais": [
            "Quais navegadores são suportados pelo aplicativo?",
            "O aplicativo funciona em dispositivos móveis?",
            "Há tutoriais disponíveis para aprender a usar o aplicativo?"
        ]
    ]
    
    @State private var selectedFaq: String?

    var body: some View {
        VStack {
            HStack {
            
                Text("Perguntas Frequentes (FAQs)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Spacer()
                
                Image("cloud")
                    .resizable()
                    .frame(width: 80, height: 60)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 30)
            
    
            
            List {
                ForEach(faq, id: \.self) { topic in
                    Section(header: Text(topic)) {
                        Button(action: {
                            withAnimation {
                                selectedFaq = (selectedFaq == topic) ? nil : topic
                            }
                        }) {
                            Text(topic)
                                .foregroundColor(.primary)
                        }

                        if selectedFaq == topic, let questions = faqDetails[topic] {
                            ForEach(questions, id: \.self) { question in
                                Text(question)
                                    .font(.subheadline)
                                    .padding(.leading)
                            }
                        }
                    }
                }
            }
        }
        .padding(.top, 10)
    }
}

#Preview {
    AskedQuestionsView()
}
