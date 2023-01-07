// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "AdventOfCode",
  products: [
    .executable(name: "advent", targets: ["AdventOfCode"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
  ],
  targets: [
    .target(
      name: "AdventOfCode",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]),
    .testTarget(
      name: "AdventOfCodeTests",
      dependencies: ["AdventOfCode"]),
  ]
)
