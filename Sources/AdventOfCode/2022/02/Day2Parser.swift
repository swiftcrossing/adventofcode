// Created on 2020/12/11.

import Foundation

struct Day2Parser {
  static func parse(_ input: String) throws -> [(Shape, Shape)] {
    input.split(separator: "\n").map(String.init).map { line in
      let thing = line.split(separator: " ").map(String.init)
      let opponent = Shape.parse(string: thing[0])
      let me = Shape.parse(string: thing[1])
      return (me, opponent)
    }
  }

  static func parse2(_ input: String) throws -> [(Shape, Shape)] {
    input.split(separator: "\n").map(String.init).map { line in
      let thing = line.split(separator: " ").map(String.init)
      let opponent = Shape.parse(string: thing[0])
      let action = Shape.parse(string: thing[1])
      let me = Shape.getShape(opponent: opponent, action: action)
      return (me, opponent)
    }
  }
}
