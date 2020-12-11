// Created on 2020/12/11.

enum ParameterError: Error {
  case day(Int)
  case part(Int)
}

enum Day: String, CaseIterable {
  case day1
  case day4

  var solution: Solution {
    switch self {
    case .day1: return Day1()
    case .day4: return Day4()
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
