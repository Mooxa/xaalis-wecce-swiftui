  //
  //  KeyPad.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 22/02/2021.
  //

import SwiftUI

struct KeyPad: View {
  @Binding var string: String

  var body: some View {
    VStack {
      KeyPadRow(keys: ["1", "2", "3"])
      KeyPadRow(keys: ["4", "5", "6"])
      KeyPadRow(keys: ["7", "8", "9"])
      KeyPadRow(keys: [".", "0", "⌫"])
    }
    .background(.clear)
    .environment(\.keyPadButtonAction, self.keyWasPressed(_:))
  }

  private func keyWasPressed(_ key: String) {
    switch key {
    case "." where string.contains("."): break
    case "." where string == "1": string += key
    case "⌫":
      string.removeLast()
      if string.isEmpty { string = "1" }
//    case "+" where string. == "1": string = key
    default: string += key
    }
  }
}

struct KeyPad_Previews: PreviewProvider {
  @State static var value = "1"
  static var previews: some View {
    KeyPad(string: $value)
  }
}
