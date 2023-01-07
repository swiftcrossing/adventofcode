// Created on 2020/12/11.

import ArgumentParser

struct Day202201Solution: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let array = try Day1Parser.parse(input)
    array.printContents(verbose: verbose)
    let calories = array.map { $0.reduce(0, +) }
    let max = calories.max()!
    return String(max)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
//    let expenses = try Day1Parser.parse(input)
//    expenses.printContents(verbose: verbose)
//
//    var product = -1
//    iLoop: for (i, iExpense) in expenses.enumerated() {
//      for (j, jExpense) in expenses.enumerated() {
//        for (k, kExpense) in expenses.enumerated()
//        where i != j && i != k && iExpense.value + jExpense.value + kExpense.value == 2020 {
//          product = iExpense.value * jExpense.value * kExpense.value
//          break iLoop
//        }
//      }
//    }
    return "String(product)"
  }
}
