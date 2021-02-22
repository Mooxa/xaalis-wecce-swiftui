//
//  Extension.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 22/02/2021.
//

import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
                .background(
                    Circle()
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
    }
}

