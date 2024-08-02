//

//  UserProfileView.swift

//  HelpDesk

//

//  Created by Larissa Martins Correa on 30/07/24.

//



import SwiftUI



struct UserProfileView: View {
    
    let configsUserProfile = ["Configurações", "Privacidade", "Segurança", "Histórico"]

    var body: some View {
        
            VStack {
                
                Image(.imagerobot).resizable().frame(maxWidth: .infinity, maxHeight: .infinity).background(.blueTertiary)
            
                Text("Username").frame(maxWidth: .infinity, maxHeight: .infinity).background(.white).foregroundColor(.gray).fontWeight(.bold)
                
                Text("Setor, Empresa").fontWeight(.semibold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel congue diam, eu suscipit turpis. In venenatis luctus odio at.").padding(4)
                
                HStack {
                    Text("Editar perfil")
                        .background(.blueSecondary)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(10)
                        .bold()
                    
                    
                    Text("Compartilhar perfil")
                        .background(.blueSecondary)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .bold()
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
