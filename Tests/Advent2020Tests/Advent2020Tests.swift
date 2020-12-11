import XCTest
import class Foundation.Bundle

final class Advent2020Tests: XCTestCase {
  func testExample() throws {
    guard #available(macOS 10.13, *) else {
      return
    }

    let fooBinary = productsDirectory.appendingPathComponent("advent")
    let inputFile = "Input/Day4/input_simple.txt"

    let process = Process()
    process.executableURL = fooBinary
    process.arguments = ["-d", "4", "-p", "1", "-i", inputFile]

    let pipe = Pipe()
    process.standardOutput = pipe

    print(process)
    try process.run()
    process.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)

    XCTAssertEqual(output, "Hello, world!\n")
  }

  /// Returns path to the built products directory.
  var productsDirectory: URL {
    #if os(macOS)
    for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
      return bundle.bundleURL.deletingLastPathComponent()
    }
    fatalError("couldn't find the products directory")
    #else
    return Bundle.main.bundleURL
    #endif
  }

  static var allTests = [
    ("testExample", testExample),
  ]
}
