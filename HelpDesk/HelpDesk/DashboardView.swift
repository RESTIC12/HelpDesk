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
                }
                .padding(.horizontal, 10)
                
                Text("\(user)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 50) // Alinhamento do texto com "Hello"
            }
            .padding()
            
            VStack(alignment: .leading) {
                ScrollView {
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
                }
                .padding()

                VStack {
                    
                    HStack {
                        Image(.useer)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("\(user)")
                            .bold()
                        Image(systemName: )
                    }
                    Text("Lorem ipsum dolor sit amet. At odit magnam et mollitia commodi qui exercitationem quidem. Et voluptatem harum in quia ipsa qui expedita autem aut maiores quae.")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                }.multilineTextAlignment(.leading)
            }
            
        } .padding(.top, 50)
        .background(Color.bluePrimary) // Set the entire background color
            .edgesIgnoringSafeArea(.all) // Extend the background to the edges of the screen
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

