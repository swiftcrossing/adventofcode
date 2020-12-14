// Created on 2020/12/11.

enum ParameterError: Error {
  case day(Int)
  case part(Int)
}

enum Day: String, CaseIterable {
  case day1
  case day2
  case day3
  case day4
  case day5
  case day6

  var solution: Solution {
    switch self {
    case .day1: return Day1()
    case .day2: return Day2()
    case .day3: return Day3()
    case .day4: return Day4()
    case .day5: return Day5()
    case .day6: return Day6()
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
