// Created on 2020/12/05.

import Foundation

struct Day6Parser {
  static func parse(_ input: String) -> [CustomsFormGroup] {
    input
      .components(separatedBy: .newlines)
      .reduce([.empty]) { (acc, next) -> [CustomsFormGroup] in
        if next.isEmpty {
          return acc + [.empty]
        }

        var acc = acc
        let form = CustomsForm(yesAnswers: Set(next.map({ String($0) })))
        acc[acc.count - 1].forms.append(form)
        return acc
      }
      .filter({ !$0.forms.isEmpty })
  }
}
