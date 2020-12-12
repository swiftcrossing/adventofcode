// Created on 2020/12/11.

import ArgumentParser

struct Day3: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day3Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let treeCount = parsed.treeCount(right: 3, down: 1)
    return String(treeCount)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day3Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let treeCounts = [
      parsed.treeCount(right: 1, down: 1),
      parsed.treeCount(right: 3, down: 1),
      parsed.treeCount(right: 5, down: 1),
      parsed.treeCount(right: 7, down: 1),
      parsed.treeCount(right: 1, down: 2),
    ]
    treeCounts.printContents(verbose: verbose)
    let treeProduct = treeCounts.reduce(1, *)
    return String(treeProduct)
  }
}
