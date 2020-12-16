// Created on 2020/12/11.

import Foundation

struct Day8Parser {
  static func parse(_ input: String) -> Program {
    let instructions = input
      .split(separator: "\n")
      .map({ line -> Instruction in
        let line = String(line)
        let operation = Operation(rawValue: String(line.prefix(3))) ?? .nop
        let sign = String(line.dropFirst(4).prefix(1))
        let unsignedOffset = Int(line.dropFirst(5)) ?? 0
        let offset = sign == "-" ? -unsignedOffset : unsignedOffset

        return Instruction(operation: operation, offset: offset)
      })

    return Program(instructions: instructions)
  }
}
