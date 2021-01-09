// Created on 2020/12/11.

import Foundation

struct Day19Parser {
  private static let quote = Character("\"")

  static func parse(_ input: String) -> ([Int: MessageRule], [Message]) {
    let components = input.components(separatedBy: "\n\n")
    let rules = parseRules(components[0].split(separator: "\n").map(String.init))
    let messages = components[1].split(separator: "\n").map(String.init).map(Message.init)
    return (rules, messages)
  }

  private static func parseRules(_ lines: [String]) -> [Int: MessageRule] {
    return lines.reduce([:]) { (acc, next) -> [Int: MessageRule] in
      var acc = acc
      let (index, rule) = parseRule(next)
      acc[index] = rule
      return acc
    }
  }

  private static func parseRule(_ line: String) -> (Int, MessageRule) {
    let components = line.components(separatedBy: ": ")
    let ruleIndex = Int(components[0])!
    let ruleContents = components[1]
    if ruleContents.first == quote && ruleContents.last == quote {
      return (ruleIndex, MessageRule.letter(ruleContents.filter({ $0 != quote })))
    } else {
      let ref = ruleContents.components(separatedBy: " | ").map({ component in
        component.split(separator: " ").map({ Int($0)! })
      })
      return (ruleIndex, MessageRule.ref(ref))
    }
  }
}
