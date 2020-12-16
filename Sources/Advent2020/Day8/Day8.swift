// Created on 2020/12/11.

import ArgumentParser

struct Day8: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = Day8Parser.parse(input)
    parsed.instructions.printContents(verbose: verbose)
    parsed.execute()
    return String(parsed.accumulator)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = Day8Parser.parse(input)
    parsed.instructions.printContents(verbose: verbose)
    var program = parsed
    var swapPointer = 0
    repeat {
      program = parsed.swapInstruction(at: swapPointer)
      program.execute()
      swapPointer += 1
    } while !program.isFinished
    return String(program.accumulator)
  }
}
