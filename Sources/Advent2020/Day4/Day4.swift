//
//  Day4.swift
//  Created by Nolan Warner on 2020/12/11.
//

import ArgumentParser

struct Day4: Solution {
  func solve1(for input: String, verbose: Bool) throws -> String {
    let passports = try Day4Parser.parse(input)

    print("Parsed contents:", verbose: verbose)
    for passport in passports {
      print("\(passport)", verbose: verbose)
    }

    let validCount = passports.filter(\.hasRequiredFields).count
    print("", verbose: verbose)
    print("Valid Count: \(validCount)", verbose: verbose)
    return String(validCount)
  }

  func solve2(for input: String, verbose: Bool) throws -> String {
    let passports = try Day4Parser.parse(input)

    print("Parsed contents:", verbose: verbose)
    for passport in passports {
      print("\(passport)", verbose: verbose)
    }

    let validCount = passports.filter(\.isValid).count
    print("", verbose: verbose)
    print("Valid Count: \(validCount)", verbose: verbose)
    return String(validCount)
  }
}
