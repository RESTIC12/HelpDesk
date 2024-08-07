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
    
    var user = "HD"
    
    var body: some View {
        
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

            Text("Help Desk")
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
                
                VStack {
                    VStack {
                        HStack {
                            HStack {
                                Text("30").frame(width: 60, height: 60)
                                Text("Qtd de chamados abertos").frame(width: 100, height: 100)
                            }
                            HStack {
                                Text("60").frame(width: 50, height: 50)
                                Text("Qtd de chamados fechados").frame(width: 100, height: 100)
                            }.frame(width: 230)
                        }
                        HStack {
                            HStack {
                                Text("60 min").frame(width: 50, height: 50)
                                Text("Tempo médio de respostas").frame(width: 100, height: 100)
                            }
                            HStack {
                                Text("1 mil").frame(width: 50, height: 50)
                                Text("Qtd de chamados totais").frame(width: 100, height: 100)
                            }.frame(width: 230)
                        }
                    }
                }.background(Color.blueTertiary)
            }
        }
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

