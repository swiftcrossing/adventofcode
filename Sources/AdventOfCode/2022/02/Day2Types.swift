// Created on 2020/12/11.

import Foundation

enum Shape: String {
  case rock
  case paper
  case scissors

  var value: Int {
    switch self {
    case .rock: return 1
    case .paper: return 2
    case .scissors: return 3
    }
  }

  var actionValue: Int {
    switch self {
    case .rock: return 0
    case .paper: return 3
    case .scissors: return 6
    }
  }

  static func parse(string: String) -> Shape {
    switch string {
    case "A", "X": return .rock
    case "B", "Y": return .paper
    case "C", "Z": return .scissors
    default: return .rock
    }
  }

  static func play(me: Shape, opponent: Shape) -> Int {
    switch (me, opponent) {
    case (.scissors, .rock), (.paper, .scissors), (.rock, .paper): return 0
    case (.rock, .rock), (.paper, .paper),  (.scissors, .scissors): return 3
    case (.scissors, .paper), (.paper, .rock), (.rock, .scissors): return 6
    }
  }

  static func getShape(opponent: Shape, action: Shape) -> Shape {
    if Shape.play(me: .rock, opponent: opponent) == action.actionValue {
      return .rock
    } else if Shape.play(me: .paper, opponent: opponent) == action.actionValue {
      return .paper
    } else {
      return .scissors
    }
  }
}
