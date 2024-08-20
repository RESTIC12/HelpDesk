//
//  AboutView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 13/08/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        HStack {
            
            Text("Sobre o call me desk")
                .textCase(.uppercase)
                .font(.title2)
                .bold()
                .foregroundColor(.blueTertiary)
                .padding(20)
            
        }
        Spacer()
        
            ScrollView {
                Text("O que é o Call me Desk?")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.blueTertiary)
                
                
                
                JustifiedTextView(
                    text: "um novo conceito em suporte técnico que busca trazer conforto e segurança para o seu dia de trabalho",
                    lineWidth: 360 // Defina a largura desejada
                )

                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Quem desenvolve o Call Me Desk?")
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .foregroundColor(.blueTertiary)

                    
                    HStack(alignment: .center) {
                        Image(.gabs)
                            .resizable()
                            .frame(width: 120, height: 120)
                        

                        
                        VStack(alignment: .leading) {
                            Text("Gabriel Palhano")
                                .fontWeight(.bold)
                                .textCase(.uppercase)
                                .foregroundColor(.white)

                            Text("Bolsista")
                            Text("IREDE")
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/gabrielpalhano/")!)
                                .foregroundColor(.white)
                                                    
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        Spacer()
                        

                    }.padding(.horizontal, 80)
                        .padding(.vertical, 5)
                    
                    HStack {
                        Image(.ikaro)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            Text("Íkaro Oliveira")
                                .fontWeight(.bold)
                                .textCase(.uppercase)
                                .foregroundColor(.white)

                            Text("Bolsista")
                            Text("IREDE")
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/ikaro-oliveira-32347123b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app")!)
                                .foregroundColor(.white)
                            
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        Spacer()

                    }.padding(.horizontal, 80)
                    .padding(.vertical, 5)
                    
                    HStack {
                        Image(.jm)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            Text("João Matheus")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Text("Bolsista")
                            Text("IREDE")
                            
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/joao-matheus-a059581a2/?original_referer=https%3A%2F%2Fgithub.com%2F")!)
                                .foregroundColor(.white)
                            
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        Spacer()

                    }.padding(.horizontal, 80)
                        .padding(.vertical, 5)
                    
                    HStack {
                        Image(.josimar)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            Text("Josimar Ferreira")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Text("Bolsista")
                            Text("IREDE")
                            Text("ver no Linkedln")
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/josimar-ferreira-7979b0176/")!)
                                .foregroundColor(.white)
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        Spacer()

                        
                    }.padding(.horizontal, 80)
                        .padding(.vertical, 5)

                    
                    HStack {
                        Image(.larissa)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            Text("Larissa Corrêa")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Text("Bolsista")
                            Text("IREDE")
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/larimscorrea/")!)
                                .foregroundColor(.white)
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        Spacer()

                    }.padding(.horizontal, 80)
                        .padding(.vertical, 5)

                    
                    HStack {
                        Image(.victor)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            Text("Victor Brigido")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Text("Bolsista")
                            Text("IREDE")
                            Link("ver no linkedln", destination: URL(string: "https://www.linkedin.com/in/victor-brigido-7b0473144/")!).foregroundColor(.white)
                        }.frame(width: 170, height: 120).background(.blueTertiary).cornerRadius(10)
                        
                        Spacer()

                    }.padding(.horizontal, 80)
                        .padding(.vertical, 5)
                        .padding(.bottom, 60)

                    Spacer()
                        
                    
                    Image(.cloud)
                        .resizable().frame(width: 120, height: 80)
                }
                
                
                
                } // Fim da função de ScrollView
        
        
        
        
            }
        
        
    
        


}

#Preview {
    AboutView()
}
