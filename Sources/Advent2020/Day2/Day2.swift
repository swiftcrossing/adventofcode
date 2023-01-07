// Created on 2020/12/11.

import ArgumentParser

struct Day2: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day2Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let score = parsed.reduce(0) { acc, next in
      acc + next.0.value + Shoot.play(me: next.0, opponent: next.1)
    }

    return String(score)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day2Parser.parse2(input)
    parsed.printContents(verbose: verbose)
    let score = parsed.reduce(0) { acc, next in
      acc + next.0.value + Shoot.play(me: next.0, opponent: next.1)
    }

    return String(score)
  }
}
