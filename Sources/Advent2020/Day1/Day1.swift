//
//  Day1.swift
//  Created by Nolan Warner on 2020/12/11.
//

import ArgumentParser

struct Day1: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let expenses = try Day1Parser.parse(input)
    expenses.printContents(verbose: verbose)

    var product = -1
    iLoop: for (i, iExpense) in expenses.enumerated() {
      for (j, jExpense) in expenses.enumerated() where i != j && iExpense.value + jExpense.value == 2020 {
        product = iExpense.value * jExpense.value
        break iLoop
      }
    }
    return String(product)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let expenses = try Day1Parser.parse(input)
    expenses.printContents(verbose: verbose)

    var product = -1
    iLoop: for (i, iExpense) in expenses.enumerated() {
      for (j, jExpense) in expenses.enumerated() {
        for (k, kExpense) in expenses.enumerated()
        where i != j && i != k && iExpense.value + jExpense.value + kExpense.value == 2020 {
          product = iExpense.value * jExpense.value * kExpense.value
          break iLoop
        }
      }
    }
    return String(product)
  }
}
