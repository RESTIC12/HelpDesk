import SwiftUI

struct DraftView: View {
    var body: some View {
        JustifiedTextView(
            text: "Este é um exemplo de justificação de texto usando SwiftUI. O texto será ajustado para caber em uma largura específica. Essa abordagem usa uma função personalizada para calcular o espaçamento necessário entre as palavras.",
            lineWidth: 300 // Defina a largura desejada
        )
        .padding()
    }
}

struct JustifiedTextView: View {
    let text: String
    let lineWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(justifiedLines(text: text, lineWidth: lineWidth), id: \.self) { line in
                HStack(spacing: 0) {
                    ForEach(line.words.indices, id: \.self) { index in
                        Text(line.words[index])
                            .font(.system(size: 16))
                            .padding(.trailing, index < line.words.count - 1 ? line.spaceWidth : 0)
                    }
                }
            }
        }
    }
    
    private func justifiedLines(text: String, lineWidth: CGFloat) -> [JustifiedLine] {
        let words = text.split(separator: " ").map(String.init)
        var lines: [JustifiedLine] = []
        var currentLine: [String] = []
        
        var currentLineWidth: CGFloat = 0
        
        for word in words {
            let wordWidth = word.widthOfString(usingFont: .systemFont(ofSize: 16))
            
            if currentLineWidth + wordWidth + CGFloat(currentLine.count) <= lineWidth {
                currentLine.append(word)
                currentLineWidth += wordWidth
            } else {
                let spaceWidth = (lineWidth - currentLineWidth) / CGFloat(max(currentLine.count - 1, 1))
                lines.append(JustifiedLine(words: currentLine, spaceWidth: spaceWidth))
                
                currentLine = [word]
                currentLineWidth = wordWidth
            }
        }
        
        if !currentLine.isEmpty {
            lines.append(JustifiedLine(words: currentLine, spaceWidth: 0))
        }
        
        return lines
    }
}

struct JustifiedLine: Hashable {
    let words: [String]
    let spaceWidth: CGFloat
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return size.width
    }
}

#Preview {
    DraftView()
}

