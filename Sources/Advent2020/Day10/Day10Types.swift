// Created on 2020/12/11.

import Foundation

struct AdapterDevice {
  let adapters: [Int]

  func chainDiffSum(verbose: Bool) -> Int {
    let diffs = getDiffs()
    print(String(describing: diffs), verbose: verbose)
    let onesCount = diffs.filter({ $0 == 1 }).count
    let threesCount = diffs.filter({ $0 == 3 }).count
    return onesCount * threesCount
  }

  func buildLookupArray() -> [Int] {
    var array = [1]
    for nextValue in (1..<100) {
      let lastValue = array[nextValue - 1]
      array += [nextValue + lastValue]
    }
    return array
  }

  func getDiffs() -> [Int] {
    zip(adapters, adapters.dropFirst()).map({ $1 - $0 })
  }

  func getOneClusters() -> [Int] {
    getDiffs()
      .reduce([0]) { (acc, next) -> [Int] in
        var acc = acc
        if next == 3 {
          if acc[acc.count - 1] == 0 {
            return acc
          } else {
            return acc + [0]
          }
        } else {
          acc[acc.count - 1] += 1
        }

        return acc
      }
      .filter({ $0 > 1 })
  }
}
