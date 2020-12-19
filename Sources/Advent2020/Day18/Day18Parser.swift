// Created on 2020/12/11.

import Foundation

struct Day18Parser {
  static func parse(_ input: String) -> [[MathSymbol]] {
    input.split(separator: "\n").map(String.init).map(parseLine)
  }

  private static func parseLine(_ line: String) -> [MathSymbol] {
    var line = line
    return parseSymbols(&line)
  }

  private static func parseSymbols(_ line: inout String) -> [MathSymbol] {
    var array: [MathSymbol] = []
    var first = line.first
    while first != nil {
      line = String(line.dropFirst())

      if first == ")" {
        break
      } else if first == "(" {
        array.append(.subby(parseSymbols(&line)))
      } else if first == "+" {
        array.append(.plus)
      } else if first == "*" {
        array.append(.times)
      } else if let int = first.flatMap(String.init).flatMap(Int.init) {
        array.append(.int(int))
      }

      first = line.first
    }

    return array
  }
}
