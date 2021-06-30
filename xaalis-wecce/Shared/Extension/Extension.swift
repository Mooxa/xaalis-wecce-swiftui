//
  //  Extension.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 22/02/2021.
  //

import SwiftUI

extension View {
  public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S: ShapeStyle {
    let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
    return clipShape(roundedRect)
      .overlay(roundedRect.strokeBorder(content, lineWidth: width))
  }
}
