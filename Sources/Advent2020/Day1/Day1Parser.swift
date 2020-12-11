// Created on 2020/12/11.

import Foundation

struct Day1Parser {
  static func parse(_ input: String) throws -> [Expense] {
    input.split(separator: "\n")
      .map(String.init)
      .compactMap(Int.init)
      .map(Expense.init)
  }
}
