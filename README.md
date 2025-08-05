# 📱 App Calculadora de Média – iOS Lab

Este projeto foi desenvolvido como parte das atividades práticas do curso **Escola iOS Lab**, com o objetivo de aprender os conceitos fundamentais do **SwiftUI**, controle de estado com `@State`, manipulação de arrays e conversão de tipos com `guard let`. O aplicativo permite inserir até 4 notas e calcular a média final com feedback visual.

> 🧑‍💻 Desenvolvedor: **Leandro Vansan de Morais**  
> 📅 Data: 02 de julho de 2025  
> 🏫 Curso: Escola iOS Lab  
> 🔢 Atividade: App para cálculo de média

---

## 🎯 Objetivo do Projeto

- Desenvolver uma interface simples e funcional com **SwiftUI**.
- Aplicar lógica básica de programação com `for`, `guard let`, e manipulação de arrays.
- Criar um layout moderno utilizando `LinearGradient` e `glassEffect`.
- Fornecer logs de depuração úteis no console do Xcode.

---

## 🚀 Funcionalidades

- Inserção de até 4 notas (em formato decimal).
- Validação das entradas para evitar dados inválidos.
- Cálculo da média das notas válidas.
- Exibição da média calculada ou mensagem de erro.
- Design responsivo com efeito de vidro (glassmorphism).
- Compatível com tema claro e escuro.

---

## 🧑‍🏫 Conceitos Aprendidos

### 🔹 `@State`
Controla valores mutáveis que fazem parte da UI, como o array de notas e o resultado da média.  
📚 [Documentação oficial](https://developer.apple.com/documentation/swiftui/state)

---

### 🔹 `guard let`
Faz a conversão segura de `String` para `Double`, evitando falhas no cálculo.  
📚 [Documentação Swift](https://www.swift.org/documentation/#The-guard-Statement)

---

### 🔹 `TextField` com `.keyboardType(.decimalPad)`
Permite a entrada de números com ponto decimal, ideal para notas.  
📚 [Documentação TextField](https://developer.apple.com/documentation/swiftui/textfield)

---

### 🔹 `ForEach`
Permite gerar dinamicamente os campos de nota a partir do índice do array.  
📚 [Documentação ForEach](https://developer.apple.com/documentation/swiftui/foreach)

---

### 🔹 `LinearGradient`
Cria um fundo colorido em degradê, adaptado para tema claro e escuro.  
📚 [Documentação LinearGradient](https://developer.apple.com/documentation/swiftui/lineargradient)

---

### 🔹 `@Environment(\.colorScheme)`
Detecta o tema atual (claro ou escuro) para alterar a paleta de cores.  
📚 [Documentação EnvironmentValues.colorScheme](https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme)

---

### 🔹 `glassEffect` (NEW iOS 26.0)
Efeito visual moderno de vidro nos campos, botões e containers.  
📚 [Documentação glassEffect](https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:))

---

### 🔹 `ZStack`, `VStack`
Permitem organizar os elementos da interface em camadas (`ZStack`) e colunas (`VStack`).  
📚 [Stacks em SwiftUI](https://developer.apple.com/documentation/swiftui/stack)

---

## 💡 Lógica de Cálculo

1. O usuário insere notas como texto.
2. A função `calcAverage()`:
   - Usa `guard let` para tentar converter cada string para `Double`.
   - Se alguma nota for inválida, interrompe o cálculo.
   - Soma as notas válidas e divide pela quantidade para obter a média.
3. O resultado é armazenado em uma variável `@State`, o que atualiza a interface automaticamente.


---

## 📄 Licença

Este projeto está licenciado sob a [Creative Commons Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).

Você é livre para:

- 📤 **Compartilhar** — copiar e redistribuir o material em qualquer meio ou formato  
- 🧪 **Adaptar** — remixar, transformar e criar a partir do material

**Sob os seguintes termos:**

- 📝 **Atribuição** — Você deve dar o devido crédito, fornecer um link para a licença e indicar se alterações foram feitas.  
- 🚫 **Não Comercial** — Você não pode usar o material para fins comerciais.  
- 🔁 **Compartilha Igual** — Se você modificar ou criar algo a partir deste material, deve distribuir suas contribuições sob a mesma licença.  
- ❗ **Sem restrições adicionais** — Não aplique termos legais ou medidas tecnológicas que restrinjam legalmente outros de fazer algo permitido pela licença.

> Esta é uma tradução informal da licença. Para os termos legais completos, consulte o [texto oficial aqui](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).  
> Você não precisa cumprir a licença para elementos do material em domínio público ou onde o uso é permitido por exceção legal.

**Copyright (c) 2025 Leandro Vansan de Morais**
