/// Atividade iOS Lab - fazer um app que calcula a média de notas.
/// Leandro Vansan de Morais - 2025.07.02.1241
///
import SwiftUI

struct ArrayNotes: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var notes: [String] = ["", "", "", ""]
    @State private var average: Double?
    @State private var status: String? = nil
    
    /// FUNÇÃO PARA CONVERTER STRING E CALCULAR A MÉDIA DAS NOTAS
    func calcAverage() {
        var sum: Double = 0.0 // Acumulador para somar todas as notas válidas
        var count: Int = 0 // Contador para saber quantas notas válidas foram somadas
        // .enumerated() percorre o array retornando dois valores ao mesmo tempo:
        // (1) o índice (posição da nota no array)
        // (2) o conteúdo (a string da nota em si)
        for (index, newNote) in notes.enumerated() {
            
            // guard let tenta converter a string para Double.
            // Se não conseguir (ex: "abc", ""), o else é executado.
            // Isso garante que só valores numéricos continuem.
            guard let noteDouble = Double(newNote) else {
                // Aqui mostramos o erro, com o índice (posição da nota) e o conteúdo inválido
                print("❌ Erro na nota \(index): '\(newNote)' não é válida")
                // O return dentro de um guard faz a função parar imediatamente.
                // Isso evita calcular média com dados incompletos ou errados.
                return
            }
            // Aqui sabemos que a conversão foi bem-sucedida. Mostramos o valor convertido.
            print("✅ Nota \(index): valor convertido = \(noteDouble)")
            // Somamos a nota no total acumulado
            sum += noteDouble
            // Contamos que uma nota válida foi considerada
            count += 1
        }
        // Depois de sair do loop, calculamos a média:
        // soma total dividida pela quantidade de notas válidas
        let avg: Double = sum / Double(count)
        // Mostra no terminal o valor da média para debug
        print("📈 Média final: \(avg)")
        // Atualiza a variável @State que é observada pela View.
        // Isso faz o texto da interface mudar automaticamente.
        average = avg
    }
    
    /// FUNÇÃO PARA DETERMINAR SE ALUNO ESTÁ APROVADO, EM RECUPERAÇÃO OU REPROVADO
    func averageStatus(avg1: Double) -> String? {
        if avg1 > 0 && avg1 <= 4.0 {
            return "você foi reprovado"
        }
        if avg1 > 4.0 && avg1 <= 5.0 {
            return "você está derecuperação"
        }
        if avg1 > 5.0 && avg1 <= 10 {
            return "você está aprovado"
        }
        return nil
    }
    
    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                colors: colorScheme == .dark
                ? [
                    Color(red: 0.15, green: 0.25, blue: 0.35).opacity(0.4),
                    Color(red: 0.15, green: 0.15, blue: 0.35).opacity(0.1)
                ]
                : [
                    Color(red: 0.32, green: 0.56, blue: 0.93).opacity(0.8),
                    Color(red: 0.56, green: 0.43, blue: 0.86).opacity(0.8),
                    Color(red: 0.98, green: 0.67, blue: 0.48).opacity(0.9)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Container principal com LiquidGlass
            GlassEffectContainer(spacing: 24) {
                VStack(spacing: 24) {
                    // Seção de entrada de notas
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Calcule sua nota final")
                            .font(.title)
                        //.bold()
                            .foregroundStyle(.primary)
                        
                        Text("Inserir as notas abaixo...")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        ForEach(notes.indices, id: \.self) { index in
                            TextField("Adicione uma nota", text: $notes[index])
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .font(.default)
                                .padding(.vertical, 25)
                                .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .frame(width: 330)
                    .padding()
                    .glassEffect(in: RoundedRectangle(cornerRadius: 24))
                    
                    // Resultado
                    VStack {
                        Text(average != nil ?
                             "📊 Sua média foi \(average!, specifier: "%.2f") então \(status ?? "status desconhecido")" :
                             "❌ Preencha com notas válidas")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .bold()
                        .multilineTextAlignment(.center)
                    }
                    .frame(width: 330, height: 80)
                    .padding()
                    .glassEffect(in: RoundedRectangle(cornerRadius: 24))
                    
                    // Botão calcular
                    Button("Calcular") {
                        calcAverage()
                        if let avg = average {
                                status = averageStatus(avg1: avg)
                            } else {
                                status = nil
                            }
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: 250, height: 60)
                    .padding()
                    .glassEffect(.regular.interactive())
                    
                }
                .padding()
            }
            .foregroundColor(colorScheme == .dark ? .white.opacity(0.8) : .black)
        }
    }
}

#Preview {
    ArrayNotes()
}
