// Created on 2020/12/11.

import Foundation

struct Password {
  let firstInt: Int
  let secondInt: Int
  let requiredLetter: String
  let value: String

  var firstIndex: Int { firstInt - 1 }
  var secondIndex: Int { secondInt - 1 }

  init(rawValue: String) {
    let parts = rawValue.split(separator: ":")
    let validationParts = parts[0].split(separator: " ")
    let countParts = validationParts[0].split(separator: "-")
    firstInt = Int(countParts[0]) ?? 0
    secondInt = Int(countParts[1]) ?? 0
    requiredLetter = String(validationParts[1])
    value = String(parts[1]).trimmingCharacters(in: .whitespacesAndNewlines)
  }

  var hasValidLetterCount: Bool {
    let requiredLetterCount = value.filter({ String($0) == requiredLetter }).count
    return firstInt <= requiredLetterCount && requiredLetterCount <= secondInt
  }

  var hasValidLetterCountAndPosition: Bool {
    let firstCount = Self.count(forChar: requiredLetter, in: value, at: firstIndex)
    let secondCount = Self.count(forChar: requiredLetter, in: value, at: secondIndex)
    return firstCount + secondCount == 1
  }

  private static func count(forChar char: String, in string: String, at index: Int) -> Int {
    guard 0 <= index && index < string.count else { return 0 }
    let charAtIndex = String(string[string.index(string.startIndex, offsetBy: index)])
    return charAtIndex == char ? 1 : 0
  }
}
