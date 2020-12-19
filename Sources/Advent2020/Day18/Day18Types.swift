// Created on 2020/12/11.

import Foundation

enum MathSymbol: Equatable {
  case int(Int)
  case plus
  case times
  indirect case subby([MathSymbol])

  var intValue: Int {
    switch self {
    case .int(let int):
      return int
    case .subby(let subby):
      return subby.evaluate()
    default:
      return 0
    }
  }
}

extension Array where Element == MathSymbol {
  func groupedBy(`operator`: MathOperator) -> [Element] {
    self
      .map({ symbol -> MathSymbol in
        switch symbol {
        case .subby(let subby):
          return .subby(subby.groupedBy(operator: `operator`))
        default:
          return symbol
        }
      })
      .split(separator: `operator`.asSymbol)
      .map(Array.init)
      .map(MathSymbol.subby)
      .reduce([]) { (acc, next) -> [MathSymbol] in
        if acc.isEmpty {
          return [next]
        } else {
          return acc + [`operator`.asSymbol, next]
        }
      }
  }

  func evaluate() -> Int {
    var acc = self[0].intValue
    var `operator` = MathOperator.add
    for symbol in self.dropFirst() {
      switch symbol {
      case .plus:
        `operator` = .add
      case .times:
        `operator` = .multiply
      case .int, .subby:
        acc = `operator`.eval(lhs: acc, rhs: symbol.intValue)
      }
    }
    return acc
  }

  func prettyPrint() -> String {
    var string = ""

    for symbol in self {
      switch symbol {
      case .int(let int):
        string += "\(int)"
      case .plus:
        string += " + "
      case .times:
        string += " * "
      case .subby(let subby):
        if subby.count == 1 {
          string += subby.prettyPrint()
        } else {
          string += "(" + subby.prettyPrint() + ")"
        }
      }
    }

    return string
  }
}

enum MathOperator: String, Equatable {
  case add = "+"
  case multiply = "*"

  var asSymbol: MathSymbol {
    switch self {
    case .add: return .plus
    case .multiply: return .times
    }
  }

  func eval(lhs: Int, rhs: Int) -> Int {
    switch self {
    case .add: return lhs + rhs
    case .multiply: return lhs * rhs
    }
  }
}
