// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "AsyncBugReport",
    products: [
        .executable(name: "AsyncBugReport", targets: ["AsyncBugReport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/async", from: "1.0.0-alpha")
    ],
    targets: [
        .target(name: "AsyncBugReport", dependencies: [ "Async" ])
    ]
)
