// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Advent2020",
  products: [
    .executable(name: "advent", targets: ["Advent2020"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1")
  ],
  targets: [
    .target(
      name: "Advent2020",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]),
    .testTarget(
      name: "Advent2020Tests",
      dependencies: ["Advent2020"]),
  ]
)
