import SwiftUI

struct MarkdownContentView: View {
    let markdown: String

    var body: some View {
        ScrollView {
            renderedMarkdown(markdown)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }

    @ViewBuilder
    private func renderedMarkdown(_ markdown: String) -> some View {
        let lines = markdown.components(separatedBy: .newlines)

        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                if line.hasPrefix("### ") {
                    Text(String(line.dropFirst(4)))
                        .font(.title3)
                        .bold()
                } else if line.hasPrefix("## ") {
                    Text(String(line.dropFirst(3)))
                        .font(.title2)
                        .bold()
                } else if line.hasPrefix("# ") {
                    Text(String(line.dropFirst(2)))
                        .font(.largeTitle)
                        .bold()
                } else if line.isEmpty {
                    Spacer().frame(height: 8)
                } else {
                    Text(.init(line)) // preserves **bold**, *italic*
                        .font(.body)
                }
            }
        }
    }
}
