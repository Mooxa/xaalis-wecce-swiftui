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
        Button(action: { self.action(self.key) }) {
            Color.clear
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
                .overlay(Text(key))
        }
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
