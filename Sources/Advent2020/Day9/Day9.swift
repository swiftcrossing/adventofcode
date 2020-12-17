// Created on 2020/12/11.

import ArgumentParser

struct Day9: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day9Parser.parse(input)
    parsed.values.printContents(verbose: verbose)
    parsed.sums.printContents(verbose: verbose)
    let oddManOut = parsed.findOddNumberOut()
    return String(oddManOut)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day9Parser.parse(input)
    parsed.values.printContents(verbose: verbose)
    parsed.sums.printContents(verbose: verbose)
    let weakness = parsed.findWeakness()
    return String(weakness)
  }
}
