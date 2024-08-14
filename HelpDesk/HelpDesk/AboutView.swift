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
            Image(systemName: "arrowshape.backward.fill")
                .resizable()
                .frame(width: 25, height: 25)

            
                .padding(.horizontal, 23)
            
            Text("Sobre o call me desk")
                .textCase(.uppercase)
                .bold()
            
                .padding(20)
            
        }
        Spacer()
        
            ScrollView {
                Text("O que é o Call me Desk?")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                
                Text("")
                
                JustifiedTextView(
                    text: "Lorem ipsum dolor sit amet. Et suscipit autem et modi eius ut expedita quisquam et omnis voluptatem eos quidem pariatur. Eum voluptatem deleniti et omnis omnis id Quis facilis et dolores soluta. Non blanditiis necessitatibus et voluptate vero ea quaerat consequuntur.",
                    lineWidth: 360 // Defina a largura desejada
                )

                
                Spacer()
                
                Text("Quem desenvolve o Call Me Desk?")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                
                HStack {
                    Image(.useer)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
    
                    
                    VStack(alignment: .leading) {
                        Text("Ângelo Gabriel")
                            .fontWeight(.semibold)
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
                        Text("Íkaro")
                            .fontWeight(.semibold)
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
                        Text("João Matheus")
                            .fontWeight(.semibold)
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
                            .fontWeight(.semibold)
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
                            .fontWeight(.semibold)
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
                            .fontWeight(.semibold)
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
