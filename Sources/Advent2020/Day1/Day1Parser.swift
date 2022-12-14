// Created on 2020/12/11.

import Foundation

struct Day1Parser {
  static func parse(_ input: String) throws -> [[Int]] {
    let thing = input.components(separatedBy: "\n")
    let wow = thing.split(separator: "").map { item in
      item.compactMap(Int.init)
    }
    return wow
  }
}
