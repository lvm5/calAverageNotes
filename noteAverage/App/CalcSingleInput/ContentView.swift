//import Swift
//import SwiftUI
//
//struct ContentView: View {
//    @State var name: String = ""
//    @State var age: String = ""
//    @State var average99: String = ""
//    
//    func hello(personalName: String, personalAge: Int) -> String {
//        "Olá \(name) você tem \(age) anos"
//    }
//    
//    func averageStatus() -> String {
//        guard let intAvg = Int(average99) else {
//            return "valor errado"
//        }
//        if intAvg < 4 {
//            return "Você foi reprovado"
//        } else if intAvg < 5 {
//            return "Você está de recuperação"
//        } else {
//            return "Você foi aprovado"
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            TextField("Seu nome", text: $name)
//                .textFieldStyle(.roundedBorder)
//                .multilineTextAlignment(.center)
//            
//            TextField("Sua idade", text: $age)
//                .textFieldStyle(.roundedBorder)
//                .multilineTextAlignment(.center)
//            
//            TextField("Qual foi sua média?", text: $average99)
//                .textFieldStyle(.roundedBorder)
//                .multilineTextAlignment(.center)
//            
//            Text(hello(personalName: name, personalAge: Int(age) ?? 0))
//            Text(averageStatus())
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
