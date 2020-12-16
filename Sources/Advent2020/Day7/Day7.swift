// Created on 2020/12/11.

import ArgumentParser

struct Day7: Solution {
  let myShinyGoldBag = Bag(adj: "shiny", color: "gold")

  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day7Parser.parse(input)
    print(String(describing: parsed), verbose: verbose)
    let count = parsed.keys
      .map({ canContain(myShinyGoldBag, in: $0, for: parsed) })
      .filter({ $0 })
      .count
    return String(count)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = try Day7Parser.parse(input)
    print(String(describing: parsed), verbose: verbose)
    let count = bagCount(in: myShinyGoldBag, for: parsed)
    return String(count)
  }

  private func canContain(_ bag: Bag, in outerBag: Bag, for ruleDict: [Bag: [BagGroup]]) -> Bool {
    let innerBagGroups = ruleDict[outerBag] ?? []
    if innerBagGroups.isEmpty {
      return false
    } else if innerBagGroups.map(\.bag).contains(bag) {
      return true
    }
    return innerBagGroups.reduce(false) { (acc, next) -> Bool in
      acc || canContain(bag, in: next.bag, for: ruleDict)
    }
  }

  private func bagCount(in outerBag: Bag, for ruleDict: [Bag: [BagGroup]]) -> Int {
    (ruleDict[outerBag] ?? []).reduce(0) { (acc, bagGroup) -> Int in
      acc + bagGroup.count + (bagGroup.count * bagCount(in: bagGroup.bag, for: ruleDict))
    }
  }
}
