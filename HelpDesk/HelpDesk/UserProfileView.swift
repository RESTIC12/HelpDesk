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
                                                
                        Image(.imagerobot).resizable().frame(maxWidth: .infinity, maxHeight: .infinity)
                    }.background(.blueTertiary)
                
                    Text("Username").frame(maxWidth: .infinity, maxHeight: .infinity).foregroundColor(.gray).fontWeight(.bold)
                    
                    Text("Setor, Empresa").fontWeight(.semibold)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel congue diam, eu suscipit turpis. In venenatis luctus odio at.").padding(4)
                    
                HStack(spacing: 20) {  // Adiciona espaçamento entre os botões
                                    Text("Editar perfil")
                                        .frame(width: 160, height: 50)  // Define a largura e a altura desejada
                                        .background(.blueTertiary)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .padding(.horizontal, 10)  // Espaçamento horizontal
                                        .bold()
                                    
                                    Text("Compartilhar perfil")
                                        .frame(width: 160, height: 50)  // Define a largura e a altura desejada
                                        .background(.blueTertiary)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .padding(.horizontal, 10)  // Espaçamento horizontal
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
        }.background(.bluePrimary)
        
        
        
    }

}



#Preview {

    UserProfileView()

}
