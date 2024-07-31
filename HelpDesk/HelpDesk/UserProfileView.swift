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
                
                Image(.imagerobot).resizable().frame(maxWidth: .infinity, maxHeight: .infinity).background(.darkPurple)
            
                Text("Username").frame(maxWidth: .infinity, maxHeight: .infinity).background(.white).foregroundColor(.gray).fontWeight(.bold)
                
                Text("Setor, Empresa").fontWeight(.semibold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel congue diam, eu suscipit turpis. In venenatis luctus odio at.")
                
                HStack {
                    Text("Editar perfil").background(.blue).frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Text("Compartilhar perfil").background(.blue).frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                



            }

        

    }

}



#Preview {

    UserProfileView()

}
