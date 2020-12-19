// Created on 2020/12/11.

import ArgumentParser

struct Day10: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day10Parser.parse(input)
    parsed.adapters.printContents(verbose: verbose)
    let sum = parsed.chainDiffSum(verbose: verbose)
    return String(sum)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day10Parser.parse(input)
    parsed.adapters.printContents(verbose: verbose)
    let lookupArray = parsed.buildLookupArray()
    let product = parsed.getOneClusters().reduce(1) { $0 * lookupArray[$1 - 1] }
    return String(product)
  }
}
