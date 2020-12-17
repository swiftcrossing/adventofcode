// Created on 2020/12/11.

import Foundation

struct ScreenData {
  static let preambleSize = 25
  let values: [Int]
  let sums: [[Int]]

  init(values: [Int]) {
    self.values = values
    self.sums = values.indices.map({ index in
      values.dropFirst(index + 1).prefix(ScreenData.preambleSize - 1).map({ $0 + values[index] })
    })
  }

  func findOddNumberOut() -> Int {
    let oddNumberOutIndex = values.indices.dropFirst(ScreenData.preambleSize).first(where: { index in
      ((index - ScreenData.preambleSize)..<index).filter({ innerIndex in
        sums[innerIndex].contains(values[index])
      }).isEmpty
    }) ?? -1
    return values[oddNumberOutIndex]
  }

  func findWeakness() -> Int {
    let oddNumberOut = findOddNumberOut()
    var weakSlice: [Int] = []
    for leftIndex in (0..<values.count) {
      var sum = values[leftIndex]
      var rightIndex = leftIndex
      while sum < oddNumberOut {
        rightIndex += 1
        sum += values[rightIndex]
      }

      if sum == oddNumberOut {
        weakSlice = values.dropFirst(leftIndex).prefix(rightIndex - leftIndex).sorted()
        break
      }
    }

    return weakSlice[0] + weakSlice[weakSlice.count - 1]
  }
}
