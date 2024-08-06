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
    
    
    var chartData = [SavingsDataPoint(month: "Seg", value: 4000),
                    SavingsDataPoint(month: "Ter", value: 5000),
                    SavingsDataPoint(month: "Quar", value: 6000),
                    SavingsDataPoint(month: "Quin", value: 4000),
                    SavingsDataPoint(month: "Sex", value: 4000)]
    
    var body: some View {
        VStack {
            
                VStack {
                    Text("Dashboard").textCase(.uppercase).bold()
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
        
    
        
        VStack(alignment: .leading) {
            
            ScrollView {
                Picker("breakdown", selection: $selectedTab) {
                    ForEach(tabs, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Chart {
                    ForEach(chartData) { item in
                        BarMark(x: .value("month", item.month), y: .value("value", item.value))
                    }
                    
                    ForEach(MockData.PieHelpDesk) { pie in
                        SectorMark(angle: .value("Qtd", pie.value),
                                   angularInset: 1.0)
                        .foregroundStyle(pie.color)
                        .cornerRadius(6)
                        .annotation(position: .overlay) {
                            Text("Qtd\(pie.value)")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        
        }
    
    struct SavingsDataPoint: Identifiable {
        let month: String
        let value: Double
        var id = UUID()
    }
    
    struct PieHelpDesk: Identifiable {
        let id = UUID()
        let indicator: String
        let value: Double
    }
    
    struct MockData {
        static var pie: [PieHelpDesk] = [
            .init(indicator: "Qtd de chamados abertos", value: 30),
            .init(indicator: "Qtd de chamados fechados", value: 60)
        ]
    }
    
    
}


#Preview {
    DashboardView()
}
