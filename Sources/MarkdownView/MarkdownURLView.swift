import SwiftUI

/// Loads Markdown content from a URL and renders it.
struct MarkdownURLView: View {
    let url: URL

    @State private var state: LoadState = .loading

    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .loaded(let markdown):
                MarkdownContentView(markdown: markdown)
            case .failed(let error):
                ContentUnavailableView(
                    "Failed to load",
                    systemImage: "exclamationmark.triangle",
                    description: Text(error.localizedDescription)
                )
            }
        }
        .task(id: url) {
            await load()
        }
    }

    private func load() async {
        state = .loading
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let markdown = String(data: data, encoding: .utf8) else {
                throw MarkdownViewError.invalidEncoding
            }
            state = .loaded(markdown)
        } catch {
            state = .failed(error)
        }
    }

    // MARK: - Load State

    private enum LoadState {
        case loading
        case loaded(String)
        case failed(Error)
    }
}
