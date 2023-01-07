// Created on 2020/12/05.

import Foundation

struct OutputWriter {
  static func write(contents: String, to file: String) throws {
    print("Solution:\n\(contents)")
    print("Solution written to \(file)")
    try contents.write(toFile: file, atomically: true, encoding: .utf8)
  }
}
