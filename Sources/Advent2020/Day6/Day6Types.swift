// Created on 2020/12/05.

import Foundation

struct CustomsForm {
  let yesAnswers: Set<String>
}

struct CustomsFormGroup {
  static let aToZ = Set((97...122).map({ String(Character(UnicodeScalar($0))) }))
  var forms: [CustomsForm]
  var anyYesAnswers: Set<String> { forms.reduce(Set()) { $0.union($1.yesAnswers) } }
  var anyYesAnswerCount: Int { anyYesAnswers.count }
  var allYesAnswers: Set<String> { forms.reduce(Self.aToZ) { $0.intersection($1.yesAnswers) } }
  var allYesAnswerCount: Int { allYesAnswers.count }

  static let empty: CustomsFormGroup = CustomsFormGroup(forms: [])
}
