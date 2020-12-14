// Created on 2020/12/11.

import Foundation

struct Seat {
  let row: Int
  let column: Int
  var seatId: Int { (row * 8) + column }
}
