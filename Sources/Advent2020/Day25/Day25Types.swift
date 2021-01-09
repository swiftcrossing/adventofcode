// Created on 2020/12/11.

import Foundation

struct HotelCards {
  let doorPublicKey: Int
  let cardPublicKey: Int

  var doorLoopSize: Int {
    Self.getLoopSize(forPublicKey: doorPublicKey)
  }

  var cardLoopSize: Int {
    Self.getLoopSize(forPublicKey: cardPublicKey)
  }

  var encryptionKeyFromDoor: Int {
    Self.getEncryptionKey(forSubject: doorPublicKey, loopSize: cardLoopSize)
  }

  var encryptionKeyFromCard: Int {
    Self.getEncryptionKey(forSubject: cardPublicKey, loopSize: doorLoopSize)
  }

  static func getLoopSize(forPublicKey publicKey: Int) -> Int {
    let subject = 7
    var value = 1
    var count = 0
    while value != publicKey {
      value *= subject
      value %= 20201227
      count += 1
    }
    return count
  }

  static func getEncryptionKey(forSubject subject: Int, loopSize: Int) -> Int {
    var value = 1
    for _ in 0..<loopSize {
      value *= subject
      value %= 20201227
    }
    return value
  }
}
