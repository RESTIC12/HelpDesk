//

//  UserProfileView.swift

//  HelpDesk

//

//  Created by Larissa Martins Correa on 30/07/24.

//



import SwiftUI


struct UserProfileView: View {
    

    var body: some View {
        VStack {
            
            
            
            VStack {
                Image(.user).resizable().frame(width: 161, height: 161)
                        Text("HD Team")
                    .fontWeight(.bold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                        Text("Configurações")
                        .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                        .background(.cyan)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)  // Espaçamento horizontal
                        .bold()
                
                Text("Tickets")
                    .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                    .background(.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)  // Espaçamento horizontal
                    .bold()
                
                Text("Dashboard")
                    .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                    .background(.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)  // Espaçamento horizontal
                    .bold()
                    
                    Text("Privacidade")
                        .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                        .background(.cyan)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)  // Espaçamento horizontal
                        .bold()
                
                Text("Perguntas frequentes")
                    .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                    .background(.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)  // Espaçamento horizontal
                    .bold()
                
                Text("Sobre o app")
                    .frame(width: 356, height: 50)  // Define a largura e a altura desejada
                    .background(.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 10)  // Espaçamento horizontal
                    .bold()
                
                Spacer()
                
                Image(.cloud)
                    .resizable()
                    .frame(width: 202, height: 125)
                
                
            }
        
            
        }
        
    }

}



#Preview {

    UserProfileView()

}
