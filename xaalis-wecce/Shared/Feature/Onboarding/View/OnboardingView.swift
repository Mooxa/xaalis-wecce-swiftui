  //
  //  OnboardingView.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 01/07/2021.
  //

import SwiftUI

struct OnboardingView: View {
  @EnvironmentObject var viewlaunch: ViewLaunch

  var body: some View {
    VStack {
      Spacer()
      Image("onboarding-1")
        .resizable()
        .frame(width: .infinity, height: 400)
      Spacer()
      Button {
        UserDefaults.standard.set(true, forKey: "LaunchBefore")
        withAnimation {
          self.viewlaunch.currentPage = "CurrencyListView"
        }
      } label: {
        Text("Continue").frame(maxWidth: 400)
          .padding()
          .foregroundColor(.white)
      }.background(.blue)

        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    .padding(12)
    .edgesIgnoringSafeArea(.top)

  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
