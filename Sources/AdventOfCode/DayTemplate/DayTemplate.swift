// Created on 2020/12/11.

import ArgumentParser

struct DayTemplate: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try DayTemplateParser.parse(input)
    parsed.printContents(verbose: verbose)
    return String(parsed.count)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try DayTemplateParser.parse(input)
    parsed.printContents(verbose: verbose)
    return String(parsed.count * 2)
  }
}
