// Created on 2020/12/11.

import Foundation

enum Shoot: String {
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

  static func parse(string: String) -> Shoot {
    switch string {
    case "A", "X": return .rock
    case "B", "Y": return .paper
    case "C", "Z": return .scissors
    default: return .rock
    }
  }

  static func play(me: Shoot, opponent: Shoot) -> Int {
    switch (me, opponent) {
    case (.scissors, .rock), (.paper, .scissors), (.rock, .paper): return 0
    case (.rock, .rock), (.paper, .paper),  (.scissors, .scissors): return 3
    case (.scissors, .paper), (.paper, .rock), (.rock, .scissors): return 6
    }
  }

  static func getShoot(opponent: Shoot, action: Shoot) -> Shoot {
    if Shoot.play(me: .rock, opponent: opponent) == action.actionValue {
      return .rock
    } else if Shoot.play(me: .paper, opponent: opponent) == action.actionValue {
      return .paper
    } else {
      return .scissors
    }
  }
}
