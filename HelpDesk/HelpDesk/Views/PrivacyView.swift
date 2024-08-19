//
//  PrivacyView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 19/08/24.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Política de Privacidade")
                    .font(.custom("Poppins-Regular", size: 28))
                    .fontWeight(.bold)
                    .padding(.bottom, 8)

                Text("""
                    A sua privacidade é muito importante para nós. Esta Política de Privacidade descreve como o aplicativo HelpDesk coleta, utiliza, compartilha e protege as suas informações pessoais.

                    **Quais dados coletamos?**
                    O HelpDesk coleta informações como seu nome, endereço de email, histórico de uso do aplicativo e dados de dispositivo. Essas informações são coletadas para personalizar sua experiência, fornecer suporte técnico e melhorar nossos serviços.

                    **Como utilizamos seus dados?**
                    Utilizamos seus dados para:

                    * Criar e manter sua conta;
                    * Fornecer suporte técnico;
                    * Analisar o uso do aplicativo para identificar áreas de melhoria;
                    * Enviar notificações importantes, como atualizações do aplicativo.

                    **Compartilhamento de dados**
                    Não compartilhamos suas informações pessoais com terceiros, exceto nos seguintes casos:

                    * **Fornecedores de serviços:** Podemos compartilhar seus dados com empresas terceirizadas que nos ajudam a operar nosso negócio, como provedores de hospedagem e serviços de análise de dados.
                    * **Proteção legal:** Podemos divulgar suas informações se for exigido por lei ou para proteger nossos direitos.

                    **Segurança dos dados**
                    Implementamos medidas de segurança técnicas e administrativas robustas para proteger seus dados, incluindo criptografia, firewalls e políticas de acesso restrito.

                    **Seus direitos**
                    Você tem o direito de acessar, corrigir ou excluir seus dados pessoais. Para exercer seus direitos, entre em contato conosco através do email.

                    **Alterações nesta política**
                    Podemos atualizar esta Política de Privacidade periodicamente. Recomendamos que você consulte esta página regularmente para obter as informações mais recentes.
                    """)
                    .font(.body)
                    .padding(.bottom, 16)
            }
            .padding()
        }
        .scrollIndicators(.never)
        .background(Color.backGround)
        .foregroundColor(.text)
    }
}

#Preview {
    PrivacyView()
}

