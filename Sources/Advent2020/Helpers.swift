//
//  Helpers.swift
//  Created by Nolan Warner on 2020/12/11.
//

func print(_ value: String, verbose: Bool) {
  if verbose {
    print(value)
  }
}

extension Array {
  func printContents(verbose: Bool) {
    print("Parsed contents:", verbose: verbose)
    for element in self {
      print("\(element)", verbose: verbose)
    }
    print("", verbose: verbose)
  }
}
