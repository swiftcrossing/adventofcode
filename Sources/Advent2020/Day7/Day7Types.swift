// Created on 2020/12/05.

import Foundation

struct BaggageRule {
  let outerBag: Bag
  let innerBagGroups: [BagGroup]
}

struct BagGroup: Equatable {
  let bag: Bag
  let count: Int
}

struct Bag: Equatable, Hashable {
  let adj: String
  let color: String
}
