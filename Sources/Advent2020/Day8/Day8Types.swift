// Created on 2020/12/11.

import Foundation

class Program {
  let instructions: [Instruction]

  var accumulator = 0
  var pointer = 0
  var executedIndices: Set<Int> = []
  var isFinished: Bool { pointer == instructions.count }

  init(instructions: [Instruction]) {
    self.instructions = instructions
  }

  func execute() {
    while !executedIndices.contains(pointer) || pointer == instructions.count {
      guard 0 <= pointer && pointer < instructions.count else { break }

      let instruction = instructions[pointer]
      executedIndices.insert(pointer)
      switch instruction.operation {
      case .acc:
        accumulator += instruction.offset
        pointer += 1
      case .jmp:
        pointer += instruction.offset
      case .nop:
        pointer += 1
      }
    }
  }

  func swapInstruction(at index: Int) -> Program {
    let instruction = instructions[index]
    var swappedInstructions = instructions
    if instruction.operation == .nop {
      swappedInstructions[index] = Instruction(operation: .jmp, offset: instruction.offset)
    } else if instruction.operation == .jmp {
      swappedInstructions[index] = Instruction(operation: .nop, offset: instruction.offset)
    }
    return Program(instructions: swappedInstructions)
  }
}

struct Instruction {
  let operation: Operation
  let offset: Int
}

enum Operation: String {
  case acc
  case jmp
  case nop
}
