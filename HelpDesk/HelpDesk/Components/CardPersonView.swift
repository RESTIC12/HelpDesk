//
//  CardPersonView.swift
//  HelpDesk
//
//  Created by Victor Brigido on 17/08/24.
//

import SwiftUI

struct CardPersonView: View {
    var name: String
    var description: String
    var imageName: String
    var description2: String
    var linkLinkedin: String
    
    var body: some View {
        HStack() {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 00, height: 100)
            
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }
            .background(Color.backGround)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.custom("Poppins-Regular", size: 18))
    
                Text(description)
                    .font(.custom("Poppins-Regular", size: 14))
                
                Text(description2)
                    .font(.custom("Poppins-Regular", size: 14))
                
                Link(linkLinkedin, destination: URL(string: linkLinkedin)!)
                    .font(.custom("Poppins-Regular", size: 8))
                    .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .frame(maxHeight: .infinity)
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.callMeDesk)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    CardPersonView(name: "Nome do aluno", description: "Desenvolvedor IOS", imageName: "", description2: "IRede", linkLinkedin: "linkedin.com")
}

