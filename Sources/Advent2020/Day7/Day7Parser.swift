// Created on 2020/12/05.

import Foundation

struct Day7Parser {
  static func parse(_ input: String) throws -> [Bag: [BagGroup]] {
    let rules = input
      .split(separator: "\n")
      .map(String.init)
      .map(parseBaggageRule)
    var dict: [Bag: [BagGroup]] = [:]
    for rule in rules {
      dict[rule.outerBag] = rule.innerBagGroups
    }
    return dict
  }

  private static func parseBaggageRule(_ line: String) -> BaggageRule {
    let pair = line.components(separatedBy: " contain ")
    let outerBagComponents = pair[0].split(separator: " ").map(String.init)
    let outerBag = Bag(adj: outerBagComponents[0], color: outerBagComponents[1])
    guard !pair[1].contains("no other bags") else {
      return BaggageRule(outerBag: outerBag, innerBagGroups: [])
    }

    let innerBagGroups = pair[1].components(separatedBy: ", ")
      .map({ innerBagGroupString -> BagGroup in
        let innerBagGroupComponents = innerBagGroupString.split(separator: " ").map(String.init)
        let bagCount = Int(innerBagGroupComponents[0]) ?? 0
        let bag = Bag(adj: innerBagGroupComponents[1], color: innerBagGroupComponents[2])
        return BagGroup(bag: bag, count: bagCount)
      })

    return BaggageRule(outerBag: outerBag, innerBagGroups: innerBagGroups)
  }
}
