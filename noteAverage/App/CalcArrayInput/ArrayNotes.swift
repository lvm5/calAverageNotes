/// Atividade iOS Lab - fazer um app que calcula a média de notas.
/// Leandro Vansan de Morais - 2025.07.02.1241
///
import SwiftUI

// MARK: - View principal do app
struct ArrayNotes: View {
    // Detecta se o sistema está no modo claro ou escuro
    @Environment(\.colorScheme) var colorScheme
    
    // Armazena as 4 notas digitadas pelo usuário como texto
    @State private var notes: [String] = ["", "", "", ""]
    
    // Armazena a média final calculada (opcional, pois começa sem valor)
    @State private var average: Double?
    
    // Armazena o status final do aluno (reprovado, recuperação, aprovado)
    @State private var status: String? = nil
    
    // MARK: - Função para calcular a média das notas
    func calcAverage() {
        var sum: Double = 0.0  // Soma acumulada das notas válidas
        var count: Int = 0     // Quantidade de notas válidas

        // Percorre todas as notas digitadas
        for (index, newNote) in notes.enumerated() {
            // Tenta converter a String para Double (nota numérica)
            guard let noteDouble = Double(newNote) else {
                print("❌ Erro na nota \(index): '\(newNote)' não é válida")
                return // Para tudo se uma nota for inválida
            }

            // Verifica se a nota está dentro da faixa permitida
            guard noteDouble >= 0 && noteDouble <= 10 else {
                print("❌ Nota fora da faixa 0–10 na posição \(index): \(noteDouble)")
                return // Para tudo se a nota for menor que 0 ou maior que 10
            }

            print("✅ Nota \(index): valor convertido = \(noteDouble)")
            sum += noteDouble
            count += 1
        }

        // Calcula a média
        let avg: Double = sum / Double(count)
        print("📈 Média final: \(avg)")
        
        // Atualiza a média na tela
        average = avg
    }
    
    // MARK: - Função que retorna o status do aluno baseado na média
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
        return "Valor fora da faixa"
    }
    
    // MARK: - Interface do usuário (tela principal)
    var body: some View {
        ZStack {
            // Fundo com gradiente que muda conforme o modo claro/escuro
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
            .ignoresSafeArea() // Faz o fundo ocupar toda a tela
            
            // MARK: - Container com efeito de vidro
            GlassEffectContainer(spacing: 24) {
                VStack(spacing: 24) {
                    
                    // MARK: - Entrada de notas (textfields)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Calcule sua nota final")
                            .font(.title)
                            .foregroundStyle(.primary)
                        
                        Text("Inserir as notas abaixo...")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        // Campo de texto para cada nota
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
                    
                    // MARK: - Exibição do resultado
                    VStack {
                        // Mostra a média e o status do aluno, ou mensagem de erro
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
                    
                    // MARK: - Botão para calcular média
                    Button("Calcular") {
                        calcAverage() // Calcula a média
                        
                        // Verifica se a média foi calculada com sucesso
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
            // Ajusta a cor do texto dependendo do modo escuro ou claro
            .foregroundColor(colorScheme == .dark ? .white.opacity(0.8) : .black)
        }
    }
}

// MARK: - Preview para Xcode Canvas
#Preview {
    ArrayNotes()
}
