import SwiftUI

struct PrivacidadeView: View {
    
    var user = "HD Team"
    
    // State para controlar o alerta
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 10) {

                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .accessibilityLabel("User Profile Image")
                    
                    Text("Hello")
                        .font(.headline)
                    Spacer()
                    
                    Image("cloudWhite")
                        .resizable()
                        .frame(width: 80, height: 60)
                }
                .padding(.horizontal, 10)
                
                Text("\(user)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 50) // Alinhamento do texto com "Hello"
            }
            .padding()
            .background(.blueTertiary)
            
            ScrollView {
                Text("Termo de Privacidade e de Proteção de Dados")
                    .font(.title2)
                    .fontWeight(.semibold)
                JustifiedTextView(
                    text: "Lorem ipsum dolor sit amet. Quo optio praesentium id adipisci quia ex officia numquam ut exercitationem harum? Ea dolorem dignissimos ut voluptas voluptates nam corporis consequatur et itaque mollitia sed sapiente quia. Qui maiores internos qui ullam omnis eum saepe dolores sed molestias numquam ut voluptas accusamus ut dolor voluptatem. Aut beatae sapiente est culpa Quis non consequatur quia qui aliquam nobis et sint porro. Eum sunt omnis cum nemo internos ab tenetur modi est perspiciatis ipsum qui autem consequatur id incidunt quos vel natus quaerat. Aut omnis nostrum ut molestiae doloribus est facere internos aut mollitia nihil. Sit blanditiis expedita sed labore odio et quas perspiciatis. Aut rerum laudantium in nostrum deleniti rem sunt reiciendis et internos sunt. Non ratione eveniet aut ipsam sunt sed nemo fugit. Sit dicta sint et molestiae iusto ut iure officiis non assumenda repellat sit ullam quam et laboriosam suscipit. Aut distinctio sunt et eaque similique et consectetur quis sit voluptatibus suscipit qui aspernatur sunt et repellendus magni quo autem deserunt. Ad distinctio reprehenderit id blanditiis velit ut officiis magni sed error assumenda sit autem accusamus eum nobis quam. Et delectus aperiam ut galisum veniam rem maiores tenetur ea porro possimus At excepturi laborum sed nulla voluptates sit impedit corrupti. Qui quod voluptatem 33 odit voluptates eum eius fuga qui ullam molestiae sed explicabo quisquam. A corporis possimus non similique magni et quibusdam quidem. Sed beatae fuga cum aliquid voluptatem est quod facilis et perspiciatis quae ut nostrum sequi aut veritatis recusandae quo doloribus corporis. Qui asperiores error in fugiat voluptas vel quia beatae. In enim totam eum veritatis totam ut enim corporis At magnam voluptatum et asperiores tempore sed distinctio doloremque? Ut natus molestias eos blanditiis autem et animi tempore a iste aliquid aut adipisci similique in sequi explicabo hic odit minus. Ut odit fuga et natus officiis sit eligendi quos cum sunt velit sed repellendus voluptatem?",
                    lineWidth: 360 // Defina a largura desejada
                )

                
                HStack(spacing: 20) {  // Adiciona espaçamento entre os botões
                    Button(action: {
                        // Exibe o alerta para "Eu aceito o termo"
                        alertMessage = "Você aceitou os termos."
                        showAlert = true
                    }) {
                        Text("Eu aceito o termo")
                            .frame(width: 160, height: 50)  // Define a largura e a altura desejada
                            .background(.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal, 10)  // Espaçamento horizontal
                            .bold()
                    }
                    
                    Button(action: {
                        // Exibe o alerta para "Eu recuso o termo"
                        alertMessage = "Você recusou os termos."
                        showAlert = true
                    }) {
                        Text("Eu recuso o termo")
                            .frame(width: 160, height: 50)  // Define a largura e a altura desejada
                            .background(.blueTertiary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal, 10)  // Espaçamento horizontal
                            .bold()
                    }
                }
                    
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Termos de Privacidade"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    PrivacidadeView()
}

