  //
  //  OnboardingLaunchView.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 01/07/2021.
  //

import SwiftUI

struct OnboardingLaunchView: View {
  @EnvironmentObject var viewlaunch: ViewLaunch

  var body: some View {
    VStack {
      if viewlaunch.currentPage == "onBoardingView" {
        OnboardingView()
      } else if viewlaunch.currentPage == "ContentView" {
        ContentView()
      } else if viewlaunch.currentPage == "CurrencyListView"{
        CurrencyListView()
      }
    }
  }
}

class ViewLaunch: ObservableObject {

    init() {
        if !UserDefaults.standard.bool(forKey: "LaunchBefore") {
                currentPage = "onBoardingView"
        } else {
            currentPage = "ContentView"
        }
    }
    @Published var currentPage: String
}

struct OnboardingLaunchView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingLaunchView()
  }
}
