//

//  UserProfileView.swift

//  HelpDesk

//

//  Created by Larissa Martins Correa on 30/07/24.

//



import SwiftUI


struct UserProfileView: View {

    
    let configsUserProfile = ["Configurações", "Notificações", "Segurança", "Tickets"]

    var body: some View {
        VStack {
            
            VStack {
                    
                    VStack {
                        
                        HStack {
                            Image(systemName: "line.3.horizontal")
                            Text ("Perfil de usuário")
                                .padding(10)
                                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                            Image(systemName: "person.badge.shield.checkmark.fill")

                        }
                        Image(.imagerobot).resizable().frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                        Text("Username").frame(maxWidth: .infinity, maxHeight: .infinity).background(.white).foregroundColor(.gray).fontWeight(.bold)
                    }.background(.blueTertiary)
                    
                    Text("Setor, Empresa").fontWeight(.semibold)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel congue diam, eu suscipit turpis. In venenatis luctus odio at.").padding(4)
                    
                    HStack {
                        Text("Editar perfil")
                            .background(.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(10)
                            .bold()
                        
                        
                        Text("Compartilhar perfil")
                            .background(.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .bold()
                    }
                    
                    

                }
        }
        
        List {
            
            ForEach(configsUserProfile, id: \.self) { product in
                NavigationLink(
                    destination: ConfigsView()) {
                        Text(product)
                        

                    }
            }
        }
        
        HStack {
            
            Button("Encerrar a sessão") {
                // Action to perfom
            }
            .buttonStyle(.borderedProminent)
            
            Button("Excluir a conta", role: .destructive) {
                // Action to perfom
            
            }
            .buttonStyle(.borderedProminent)
        
            
        }
    }

}



#Preview {

    UserProfileView()

}
