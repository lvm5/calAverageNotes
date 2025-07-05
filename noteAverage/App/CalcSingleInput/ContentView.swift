/// Atividade iOS Lab - fazer um app que calcula a média de notas.
/// Leandro Vansan de Morais - 2025.07.02.1241
///

//import SwiftUI
//
//struct ContentView: View {
//    
//    @Environment(\.colorScheme) var colorScheme
//    @State var input1: String = ""
//    @State var input2: String = ""
//    @State var input3: String = ""
//    @State var input4: String = ""
//    @State private var average: Float? = nil
//    
//    var body: some View {
//        
//        ZStack {
//            LinearGradient(colors: [.yellow.opacity(0.2), .red, .blue.opacity(0.2), .green], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 16) {
//                Text("Calcule sua nota final")
//                    .font(.title.bold())
//                    .padding()
//                Group {
//                    TextField("Digite a sua nota 1", text: $input1)
//                    TextField("Digite a sua nota 2", text: $input2)
//                    TextField("Digite a sua nota 3", text: $input3)
//                    TextField("Digite a sua nota 4", text: $input4)
//                }
//                .frame(width: 310, height: 50, alignment: .center)
//                .multilineTextAlignment(.center)
//                .font(.default.bold())
//                .background((colorScheme == .dark ? Color.white : Color.black).opacity(0.1))
//                .cornerRadius(8)
//                .keyboardType(.decimalPad)
//                .padding(.horizontal, 8)
//                
//                Spacer()
//
//                if let avg = average {
//                    Text("Sua média final foi \(avg, specifier: "%.2f")")
//                        .foregroundStyle(avg >= 6 ? Color.green : Color.red)
//                } else {
//                    Text("Preencha todas as notas corretamente")
//                        .font(.caption)
//                    
//                }
//                Button("Calcular") {
//                    guard let n1 = Float(input1),
//                          let n2 = Float(input2),
//                          let n3 = Float(input3),
//                          let n4 = Float(input4)
//                    else {
//                        average = nil
//                        return
//                    }
//                    average = (n1 + n2 + n3 + n4) / 4
//                    print("Notas: \(n1), \(n2), \(n3), \(n4) | Média: \(average!)")
//                }
//                .font(.title3.bold())
//                .frame(width: 230, height: 50)
//                .glassEffect(.regular.tint(.blue.opacity(0.1)))
//                
//                
//                
//                Spacer()
//            }
//            .padding()
//            .background(
//                //MARK: - Fundo com efeito vidro
//                RoundedRectangle(cornerRadius: 32)
//                    .fill(.ultraThinMaterial)
//                    .shadow(radius: 10)
//            )
//            .padding()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
