// Created on 2020/12/11.

import Foundation

struct Day25Parser {
  static func parse(_ input: String) throws -> HotelCards {
    let values = input.split(separator: "\n")

    return HotelCards(
      doorPublicKey: Int(values[0])!,
      cardPublicKey: Int(values[1])!
    )
  }
}
