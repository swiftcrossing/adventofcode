// Created on 2020/12/11.

import ArgumentParser

struct Day18: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = Day18Parser.parse(input)
    let solutions = parsed.map({ $0.evaluate() })
    zip(parsed, solutions)
      .map({ (array, solution) in
        array.prettyPrint() + " = \(solution)"
      })
      .printContents(verbose: verbose)
    let solution = solutions.reduce(0, +)
    return String(solution)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = Day18Parser.parse(input)
      .map({ $0.groupedBy(operator: .multiply) })
    let solutions = parsed.map({ $0.evaluate() })
    zip(parsed, solutions)
      .map({ (array, solution) in
        array.prettyPrint() + " = \(solution)"
      })
      .printContents(verbose: verbose)
    let solution = solutions.reduce(0, +)
    return String(solution)
  }
}
