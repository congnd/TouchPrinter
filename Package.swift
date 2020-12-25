// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "TouchPrinter",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "TouchPrinter",
            targets: ["TouchPrinter"])
    ],
    targets: [
        .target(name: "TouchPrinter", path: "TouchPrinter"),
    ],
    swiftLanguageVersions: [.v5]
)
