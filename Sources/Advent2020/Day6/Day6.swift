// Created on 2020/12/11.

import ArgumentParser

struct Day6: Solution {
  func solve1(for input: String, verbose: Bool) -> String {
    let parsed = Day6Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let anyYesAnswerCount = parsed.map(\.anyYesAnswerCount).reduce(0, +)
    return String(anyYesAnswerCount)
  }

  func solve2(for input: String, verbose: Bool) -> String {
    let parsed = Day6Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let allYesAnswerCount = parsed.map(\.allYesAnswerCount).reduce(0, +)
    return String(allYesAnswerCount)
  }
}
