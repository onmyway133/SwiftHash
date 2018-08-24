// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "SwiftHash",
  products: [
    .library(name: "SwiftHash", targets: ["SwiftHash"])
  ],
  dependencies: [],
  targets: [ .target(name: "SwiftHash", path: "Sources") ]
)
