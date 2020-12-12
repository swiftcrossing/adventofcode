// Created on 2020/12/11.

import ArgumentParser

struct Day2: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day2Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let validCount = parsed.filter(\.hasValidLetterCount).count
    return String(validCount)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day2Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let validCount = parsed.filter(\.hasValidLetterCountAndPosition).count
    return String(validCount)
  }
}
