// Created on 2020/12/11.

import Foundation

enum MessageRule {
  case letter(String)
  case ref([[Int]])
}

struct Message: Equatable {
  let value: String
}
