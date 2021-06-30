  //
  //  KeyPadButton.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 22/02/2021.
  //

import SwiftUI

struct KeyPadButton: View {
  var key: String
  var body: some View {
    Button(action: { self.action(self.key) }, label: {
      Color.clear
        .overlay(
          RoundedRectangle(cornerRadius: 50)
            .background(.ultraThinMaterial)
        )
        .overlay(Text(key)
                  .font(.system(size: 30)))
    })
  }
  enum ActionKey: EnvironmentKey {
    static var defaultValue: (String) -> Void { { _ in } }
  }
  @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
  var keyPadButtonAction: (String) -> Void {
    get { self[KeyPadButton.ActionKey.self] }
    set { self[KeyPadButton.ActionKey.self] = newValue }
  }
}

struct KeyPadButton_Previews: PreviewProvider {
  static var previews: some View {
    KeyPadButton(key: "8")
      .padding()
      .frame(width: 80, height: 80)
      .previewLayout(.sizeThatFits)
  }
}
