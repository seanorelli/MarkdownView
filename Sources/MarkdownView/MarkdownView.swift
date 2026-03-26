import SwiftUI

/// A SwiftUI view that renders Markdown content.
///
/// Use `MarkdownView` to display Markdown directly from a `String` or load it
/// asynchronously from a `.md` file URL.
///
/// ```swift
/// // Inline string
/// MarkdownView(markdown: "# Hello\nThis is **bold** and _italic_ text.")
///
/// // Remote or local file URL
/// MarkdownView(url: URL(string: "https://example.com/README.md")!)
/// ```
public struct MarkdownView: View {
    private let source: Source

    // MARK: - Init

    /// Creates a view that renders the given Markdown string.
    public init(markdown: String) {
        self.source = .string(markdown)
    }

    /// Creates a view that loads and renders the Markdown file at the given URL.
    public init(url: URL) {
        self.source = .url(url)
    }

    // MARK: - Body

    public var body: some View {
        switch source {
        case .string(let markdown):
            MarkdownContentView(markdown: markdown)
        case .url(let url):
            MarkdownURLView(url: url)
        }
    }

    // MARK: - Source

    private enum Source {
        case string(String)
        case url(URL)
    }
}
