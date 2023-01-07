// Created on 2020/12/11.

enum ParameterError: Error {
  case day(Int)
  case part(Int)
}

enum Day: String, CaseIterable {
  case day1
  case day2
//  case day3
//  case day4
//  case day5
//  case day6
//  case day7
//  case day8
//  case day9
//  case day10
//  case day11
//  case day12
//  case day13
//  case day14
//  case day15
//  case day16
//  case day17
//  case day18
//  case day19
//  case day20
//  case day21
//  case day22
//  case day23
//  case day24
//  case day25

  var solution: Solution {
    switch self {
    case .day1: return Day202201Solution()
    case .day2: return Day202202Solution()
//    case .day3: return Day3()
//    case .day4: return Day4()
//    case .day5: return Day5()
//    case .day6: return Day6()
//    case .day7: return Day7()
//    case .day8: return Day8()
//    case .day9: return Day9()
//    case .day10: return Day10()
//    case .day11: return Day11()
//    case .day12: return Day12()
//    case .day13: return Day13()
//    case .day14: return Day14()
//    case .day15: return Day15()
//    case .day16: return Day16()
//    case .day17: return Day17()
//    case .day18: return Day18()
//    case .day19: return Day19()
//    case .day20: return Day20()
//    case .day21: return Day21()
//    case .day22: return Day22()
//    case .day23: return Day23()
//    case .day24: return Day24()
//    case .day25: return Day25()
    }
  }

  init?(intValue: Int) {
    if let day = Day(rawValue: "day\(intValue)") {
      self = day
    } else {
      return nil
    }
  }

  static var possibleValues: String {
    allCases.map({ String($0.rawValue.dropFirst(3)) }).joined(separator: ", ")
  }
}
