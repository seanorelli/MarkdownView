// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MarkdownView",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "MarkdownView",
            targets: ["MarkdownView"]
        ),
    ],
    targets: [
        .target(
            name: "MarkdownView",
            path: "Sources/MarkdownView"
        ),
        .testTarget(
            name: "MarkdownViewTests",
            dependencies: ["MarkdownView"],
            path: "Tests/MarkdownViewTests"
        ),
    ]
)
