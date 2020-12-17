// Created on 2020/12/11.

import Foundation

struct Day9Parser {
  static func parse(_ input: String) throws -> ScreenData {
    ScreenData(
      values: input.split(separator: "\n").compactMap({ Int(String($0)) })
    )
  }
}
