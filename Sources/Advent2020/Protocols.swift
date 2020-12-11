// Created on 2020/12/11.

import Foundation

protocol Solution {
  func solve(for input: String, part: Int, verbose: Bool) throws -> String
  func solve1(for input: String, verbose: Bool) throws -> String
  func solve2(for input: String, verbose: Bool) throws -> String
}

extension Solution {
  func solve(for input: String, part: Int, verbose: Bool) throws -> String {
    if part == 1 {
      return try solve1(for: input, verbose: verbose)
    } else if part == 2 {
      return try solve2(for: input, verbose: verbose)
    } else {
      throw ParameterError.part(part)
    }
  }
}
