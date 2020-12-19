// Created on 2020/12/11.

import Foundation

struct Day10Parser {
  static func parse(_ input: String) throws -> AdapterDevice {
    let adapters = input.split(separator: "\n").compactMap({ Int(String($0)) }).sorted()
    return AdapterDevice(
      adapters: [0] + adapters + [adapters[adapters.count - 1] + 3]
    )
  }
}
