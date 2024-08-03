//
//  PrivacidadeView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 01/08/24.
//

import SwiftUI

struct PrivacidadeView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "line.3.horizontal")
            Text ("Help desk")
                .padding(10)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            Image(systemName: "person.badge.shield.checkmark.fill")

        }
        .background(.bluePrimary)
        
        Text("Termo de Privacidade e de Proteção de Dados")
            .font(.title2)
            .fontWeight(.semibold)
        ScrollView {
            Text("Lorem ipsum dolor sit amet. Quo optio praesentium id adipisci quia ex officia numquam ut exercitationem harum? Ea dolorem dignissimos ut voluptas voluptates nam corporis consequatur et itaque mollitia sed sapiente quia. Qui maiores internos qui ullam omnis eum saepe dolores sed molestias numquam ut voluptas accusamus ut dolor voluptatem. Aut beatae sapiente est culpa Quis non consequatur quia qui aliquam nobis et sint porro. </p><p>Eum sunt omnis cum nemo internos ab tenetur modi est perspiciatis ipsum qui autem consequatur id incidunt quos vel natus quaerat. Aut omnis nostrum ut molestiae doloribus est facere internos aut mollitia nihil. Sit blanditiis expedita sed labore odio et quas perspiciatis. </p><p>Aut rerum laudantium in nostrum deleniti rem sunt reiciendis et internos sunt. Non ratione eveniet aut ipsam sunt sed nemo fugit. Sit dicta sint et molestiae iusto ut iure officiis non assumenda repellat sit ullam quam et laboriosam suscipit. Aut distinctio sunt et eaque similique et consectetur quis sit voluptatibus suscipit qui aspernatur sunt et repellendus magni quo autem deserunt. </p><p>Ad distinctio reprehenderit id blanditiis velit ut officiis magni sed error assumenda sit autem accusamus eum nobis quam. Et delectus aperiam ut galisum veniam rem maiores tenetur ea porro possimus At excepturi laborum sed nulla voluptates sit impedit corrupti. Qui quod voluptatem 33 odit voluptates eum eius fuga qui ullam molestiae sed explicabo quisquam. </p><p>A corporis possimus non similique magni et quibusdam quidem. Sed beatae fuga cum aliquid voluptatem est quod facilis et perspiciatis quae ut nostrum sequi aut veritatis recusandae quo doloribus corporis. Qui asperiores error in fugiat voluptas vel quia beatae. In enim totam eum veritatis totam ut enim corporis At magnam voluptatum et asperiores tempore sed distinctio doloremque? </p><p>Ut natus molestias eos blanditiis autem et animi tempore a iste aliquid aut adipisci similique in sequi explicabo hic odit minus. Ut odit fuga et natus officiis sit eligendi quos cum sunt velit sed repellendus voluptatem?")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineLimit(nil)
                .padding(16.0)
                
            HStack {
                
                Button("Eu aceito o termo") {
                    // Action to perfom
                }
                .buttonStyle(.borderedProminent)
                
                Button("Eu recuso o termo", role: .destructive) {
                    // Action to perfom
                
                }
                .buttonStyle(.borderedProminent)
            }
                
        }
    }
}

#Preview {
    PrivacidadeView()
}
