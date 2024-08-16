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
                    text: "Lorem ipsum dolor sit amet. Et suscipit autem et modi eius ut expedita quisquam et omnis voluptatem eos quidem pariatur. Eum voluptatem deleniti et omnis omnis id Quis facilis et dolores soluta. Non blanditiis necessitatibus et voluptate vero ea quaerat consequuntur.",
                    lineWidth: 360 // Defina a largura desejada
                )

                
                Spacer()
                
                Text("Quem desenvolve o Call Me Desk?")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.blueTertiary)

                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
    
                    
                    VStack(alignment: .leading) {
                        Text("Ângelo Gabriel")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(.blueTertiary)

                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                                                
                    }
                    Spacer()
                    

                }
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("Íkaro")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(.blueTertiary)

                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                        
                    }
                    Spacer()

                }
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("João Matheus")
                            .fontWeight(.bold)
                            .foregroundColor(.blueTertiary)
                            .textCase(.uppercase)
                        
                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                        
                    }
                    Spacer()

                }
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("Josimar")
                            .fontWeight(.bold)
                            .foregroundColor(.blueTertiary)
                            .textCase(.uppercase)
                        
                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                    }
                    Spacer()

                    
                }
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("Larissa Corrêa")
                            .fontWeight(.bold)
                            .foregroundColor(.blueTertiary)
                            .textCase(.uppercase)
                        
                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                    }
                    Spacer()

                }
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("Victor")
                            .fontWeight(.bold)
                            .foregroundColor(.blueTertiary)
                            .textCase(.uppercase)
                        
                        Text("Cargo")
                        Text("IREDE")
                        Text("ver no Linkedln")
                    }
                    
                    Spacer()

                }
                Spacer()
                    
                
                Image(.cloud)
                    .resizable().frame(width: 120, height: 80)
                }
            }
        
        
    
        


}

#Preview {
    AboutView()
}
