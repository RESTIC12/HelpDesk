//
//  DashboardView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 01/08/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
            Text("Username")
                .fontWeight(.heavy)
                .foregroundStyle(.gray)
        }
        
        VStack {
            HStack {
                Text("Quantidade de chamados abertos").frame(width: 100, height: 100)
                Text("Quantidade de chamados fechados").frame(width: 100, height: 100)
            }
            HStack {
                Text("Quantidade de chamados abertos").frame(width: 100, height: 100)
                Text("Quantidade de chamados fechados").frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    DashboardView()
}
