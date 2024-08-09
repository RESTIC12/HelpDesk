//
//  DashboardView.swift
//  HelpDesk
//
//  Created by Larissa Martins Correa on 01/08/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
    
    @State var selectedTab = "Mensal"
    var tabs = ["Mensal", "Semanal", "Diário"]
    
    var month = ["May", "Jun", "Jul", "Aug", "Setem"]
    
    // Dados do gráfico de barras
    var chartData = [
        SavingsDataPoint(month: "Seg", value: 4000),
        SavingsDataPoint(month: "Ter", value: 5000),
        SavingsDataPoint(month: "Quar", value: 6000),
        SavingsDataPoint(month: "Quin", value: 4000),
        SavingsDataPoint(month: "Sex", value: 4000)
    ]
    
    // Dados do gráfico de pizza
    var pieChartData = [
        SavingsDataPoint(month: "Chamados Abertos", value: 30),
        SavingsDataPoint(month: "Chamados Fechados", value: 60),
        SavingsDataPoint(month: "Outros", value: 10)
    ]
    
    var user = "HD Team"
    var grade = 5

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
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
                    
                    Image("cloud")
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
            
            ScrollView {
            VStack(alignment: .leading) {
                    Picker("breakdown", selection: $selectedTab) {
                        ForEach(tabs, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Gráfico de Barras
                    Chart {
                        ForEach(chartData) { item in
                            BarMark(
                                x: .value("Dia", item.month),
                                y: .value("Valor", item.value)
                            )
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    
                    // Gráfico de Pizza
                    Chart {
                        ForEach(pieChartData) { item in
                            SectorMark(
                                angle: .value("Quantidade", item.value),
                                innerRadius: .ratio(0.5),
                                outerRadius: .ratio(1.0)
                            )
                            .foregroundStyle(by: .value("Categoria", item.month))
                            .annotation(position: .overlay) {
                                Text("\(Int(item.value))")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    
                    VStack(spacing: 20) { // Add some spacing between boxes
                        HStack(spacing: 10) { // Add spacing between elements in each box
                            Text("30")
                            Text("Qtd de chamados abertos")
                            
                            Text("60")
                            Text("Qtd de chamados fechados")
                            
                        }
                        .padding()

                        
                        HStack(spacing: 10) {
                            Text("60 min")
                            Text("Tempo médio de respostas")
                            
                            Text("1 mil")
                            Text("Qtd de chamados totais")
                    
                        }             .padding()

                        
                        
                    }
                    .padding()
                    .background(Color.blueTertiary)
                    .cornerRadius(12)
                    .frame(maxWidth: .infinity)
                
                .padding()

                VStack {
                    
                    HStack {
                        VStack {
                            Image(.useer)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("\(user)")
                                .bold()
                        }
        
                        JustifiedTextView(
                            text: "Lorem ipsum dolor sit amet. At odit magnam et mollitia commodi qui exercitationem quidem.",
                            lineWidth: 130)
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        
                        VStack {
                            Text("1 mil avaliações")
                                .textCase(.uppercase)
                                .font(.system(size: 12))
                             
                             
                             Text("\(grade)")
                                 .bold()
                                 .padding(.horizontal, 50)
                                 .font(.system(size: 28))
                            
                            HStack {
                                Image(.star)
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                Image(.star)
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                Image(.star)
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                Image(.star)
                                    .resizable()
                                    .frame(width: 23, height: 23)
                                Image(.star)
                                    .resizable()
                                    .frame(width: 23, height: 23)
                            }
                                  
                        }
                    }
    
                    
                }.multilineTextAlignment(.leading)
            }
            
        }
        }  .padding(.top, 50)
            .background(Color.bluePrimary)
                .edgesIgnoringSafeArea(.all)
        
}
    
    struct SavingsDataPoint: Identifiable {
        let month: String
        let value: Double
        var id = UUID()
    }
}

#Preview {
    DashboardView()
}

