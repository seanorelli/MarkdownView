import XCTest
@testable import MarkdownView

final class MarkdownViewTests: XCTestCase {
    func testMarkdownViewErrorDescription() {
        let error = MarkdownViewError.invalidEncoding
        XCTAssertNotNil(error.errorDescription)
        XCTAssertFalse(error.errorDescription!.isEmpty)
    }
}
