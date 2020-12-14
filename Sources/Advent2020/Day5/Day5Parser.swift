// Created on 2020/12/11.

import Foundation

struct Day5Parser {
  static func parse(_ input: String) -> [Seat] {
    input
      .components(separatedBy: .newlines)
      .filter({ !$0.isEmpty })
      .map { line in
        let rowString = line.prefix(7).map({ String($0) == "F" ? "0" : "1" }).joined()
        let columString = line.dropFirst(7).map({ String($0) == "L" ? "0" : "1" }).joined()
        let row = Int(rowString, radix: 2) ?? 0
        let column = Int(columString, radix: 2) ?? 0
        return Seat(row: row, column: column)
      }
  }
}
