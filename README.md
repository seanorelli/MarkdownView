# MarkdownView

A lightweight SwiftUI package for rendering Markdown content using Apple's built-in `AttributedString` — no external dependencies.

## Requirements

- iOS 16+ / macOS 13+
- Swift 5.9+

## Installation

### Swift Package Manager

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/MarkdownView", from: "1.0.0")
]
```

Or add it via Xcode: **File → Add Package Dependencies…**

## Usage

### Inline Markdown string

```swift
import MarkdownView
import SwiftUI

struct ContentView: View {
    var body: some View {
        MarkdownView(markdown: """
        # Hello, MarkdownView

        This is **bold**, _italic_, and `inline code`.

        ## Features
        - Native `AttributedString` rendering
        - No external dependencies
        - iOS 16+ and macOS 13+

        [Visit Apple](https://www.apple.com)
        """)
    }
}
```

### Loading from a URL

`MarkdownView` can load and render a `.md` file from any URL — local or remote. It shows a loading indicator while fetching and a user-friendly error view on failure.

```swift
import MarkdownView
import SwiftUI

struct ContentView: View {
    let readmeURL = URL(string: "https://raw.githubusercontent.com/apple/swift/main/README.md")!

    var body: some View {
        MarkdownView(url: readmeURL)
    }
}
```

### Local file URL

```swift
if let fileURL = Bundle.main.url(forResource: "guide", withExtension: "md") {
    MarkdownView(url: fileURL)
}
```

## Supported Markdown

`MarkdownView` uses `AttributedString(markdown:)` which supports the following inline syntax:

| Syntax | Result |
|--------|--------|
| `**bold**` | **bold** |
| `_italic_` | _italic_ |
| `` `code` `` | `code` |
| `[link](url)` | clickable link |
| `~~strikethrough~~` | ~~strikethrough~~ |

> Block-level elements such as headings, lists, and blockquotes are rendered as styled text via the `.inlineOnlyPreservingWhitespace` interpretation strategy, which preserves line structure while keeping the implementation simple and dependency-free.

## License

MIT
