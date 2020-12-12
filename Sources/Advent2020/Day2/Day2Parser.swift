// Created on 2020/12/11.

import Foundation

struct Day2Parser {
  static func parse(_ input: String) throws -> [Password] {
    input.split(separator: "\n").map(String.init).map(Password.init)
  }
}
