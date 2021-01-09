// Created on 2020/12/11.

import ArgumentParser

struct Day19: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let (rules, messages) = Day19Parser.parse(input)
    print(String(describing: rules), verbose: verbose)
    print(String(describing: messages), verbose: verbose)
    let theMessages = validMessages(at: 0, from: rules)
    let validCount = messages.filter({ theMessages.contains($0.value) }).count
//    let validArray = messages
//      .map({ message -> Bool in
//        var message = message.value
//        return isMessageValid(&message, for: rules[0]!, ruleMap: rules) && message.isEmpty
//      })
//    let validCount = validArray
//      .filter({ $0 })
//      .count

    return String(validCount)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let (rules, messages) = Day19Parser.parse(input)
    print(String(describing: rules), verbose: verbose)
    print(String(describing: messages), verbose: verbose)
    return String(2)
  }

  private func isMessageValid(_ string: inout String, for rule: MessageRule, ruleMap: [Int: MessageRule]) -> Bool {
    guard !string.isEmpty else { return true }

    switch rule {
    case .letter(let letter):
      let firstLetter = string.first.flatMap(String.init)!
      let isValid = letter == firstLetter
      if isValid {
        string = String(string.dropFirst())
      }
      return isValid
    case .ref(let refList):
      var partialString = string
      let isValid = refList.reduce(false) { (acc, next) -> Bool in
        return acc || next.reduce(true, { (innerAcc, index) -> Bool in
          return innerAcc && isMessageValid(&partialString, for: ruleMap[index]!, ruleMap: ruleMap)
        })
      }
      if isValid {
        string = partialString
      }
      return isValid
    }
  }

  private func validMessages(at index: Int, from rules: [Int: MessageRule]) -> [String] {
    let rule = rules[index]!
    switch rule {
    case .letter(let letter):
      return [letter]
    case .ref(let ref):
      return ref.map({ indexGroup in
        indexGroup.map({ validMessages(at: $0, from: rules) }).expand()
      }).flatMap({ $0 })
    }
  }
}

extension Array where Element == Array<String> {
  func expand() -> [String] {
    self.reduce([]) { (acc, next) -> [String] in
      if acc.isEmpty {
        return next
      } else {
        return acc.map({ lhs in
          next.map({ rhs in
            lhs + rhs
          })
        }).flatMap({ $0 })
      }
    }
  }
}
