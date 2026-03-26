import Foundation

/// Errors that can occur when loading Markdown content.
public enum MarkdownViewError: LocalizedError {
    /// The file data could not be decoded as UTF-8 text.
    case invalidEncoding

    public var errorDescription: String? {
        switch self {
        case .invalidEncoding:
            return "The file could not be read as UTF-8 text."
        }
    }
}
