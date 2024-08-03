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
            
            HStack {
                Image(systemName: "line.3.horizontal")
                Text ("Help Desk")
                    .padding(10)
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                Image(systemName: "person.badge.shield.checkmark.fill")

            }
                
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
        }.background(Color.bluePrimary)
        
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
                }
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
