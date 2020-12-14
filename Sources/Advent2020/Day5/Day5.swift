// Created on 2020/12/11.

import ArgumentParser

struct Day5: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let parsed = Day5Parser.parse(input)
    parsed.printContents(verbose: verbose)
    let largestSeatId = parsed.map(\.seatId).sorted(by: >).first ?? 0
    return String(largestSeatId)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let parsed = Day5Parser.parse(input)
    parsed.printContents(verbose: verbose)
    var seatList = Array(0..<1024)
    for seat in parsed {
      seatList[seat.seatId] = -1
    }
    seatList = Array(seatList.drop(while: { $0 != -1 }))
    let seatId = seatList.first(where: { $0 != -1 }) ?? 0
    return String(seatId)
  }
}
