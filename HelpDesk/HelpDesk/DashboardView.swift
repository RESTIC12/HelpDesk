import SwiftUI
import Charts

struct DashboardView: View {

    @State var selectedTab = "Diário"
    var tabs = ["Diário", "Semanal", "Mensal"]
    
    var month = ["May", "Jun", "Jul", "Aug", "Setem"]
    var weeks = [""]
    var days = ["Seg", "Ter", "Quar", "Quin", "Sex"]
    var indicador = ["Chamados Abertos", "Chamados Fechados", "Outros"]
    
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
        PieChartDataPoint(indicador: "Chamados Abertos", value: 30),
        PieChartDataPoint(indicador: "Chamados Fechados", value: 60),
        PieChartDataPoint(indicador: "Outros", value: 10)
    ]
    
    // Dados do gráfico de linha para as avaliações
    var lineChartData = [
        SavingsDataPoint(month: "Jan", value: 4.0),
        SavingsDataPoint(month: "Feb", value: 4.5),
        SavingsDataPoint(month: "Mar", value: 4.2),
        SavingsDataPoint(month: "Apr", value: 4.8),
        SavingsDataPoint(month: "May", value: 4.7),
        SavingsDataPoint(month: "Jun", value: 5.0)
    ]
    
    var user: String = "HD Team"
    var grade: Int = 5
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {

                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
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
                    .padding(.leading, 50)
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
                                x: .value("Dia", item.month ?? ""), // Descompactando o valor opcional
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
                            .foregroundStyle(by: .value("Categoria", item.indicador))
                            .annotation(position: .overlay) {
                                Text("\(Int(item.value))")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("30")
                            Text("Qtd de chamados abertos")
                            
                            Text("60")
                            Text("Qtd de chamados fechados")
                        }
                        .padding()
                        
                        HStack {
                            Text("60 min")
                            Text("Tempo médio de respostas")
                            
                            Text("1 mil")
                            Text("Qtd de chamados totais")
                        }
                        .padding()
                    }
                    .padding()
                    .background(Color.blueTertiary)
                    .cornerRadius(12)
                    .frame(maxWidth: .infinity)
                    .padding()

                    VStack {
                        Text("Como somos vistos por nossos usuários?")
                            .fontWeight(.bold)
                            .font(.title2)
                            .multilineTextAlignment(.trailing)
                        
                        HStack {
                            VStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(user)")
                                    .bold()
                            }

                            JustifiedTextView(
                                text: "Lorem ipsum dolor sit amet. At odit magnam et mollitia commodi qui exercitationem quidem.",
                                lineWidth: 130
                            )
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

                        // Gráfico de Linha para Avaliações
                        VStack(alignment: .leading) {
                            Text("Avaliações ao longo do tempo")
                                .font(.headline)
                                .padding(10)
                            
                            Chart {
                                ForEach(lineChartData) { item in
                                    LineMark(
                                        x: .value("Mês", item.month ?? ""), // Descompactando o valor opcional
                                        y: .value("Nota", item.value)
                                    )
                                }
                            }
                            .frame(height: 200)
                            .padding()
                        }
                    }
                    .multilineTextAlignment(.leading)
                }
            }
        }
        .padding(.top, 50)
        .background(Color.blue.opacity(0.05))
        .edgesIgnoringSafeArea(.all)
    }
    
    struct SavingsDataPoint: Identifiable {
        let month: String?
        let value: Double
        var id = UUID()
    }
    
    struct PieChartDataPoint: Identifiable {
        let indicador: String
        let value: Double
        var id = UUID()
    }
}

#Preview {
    DashboardView()
}

