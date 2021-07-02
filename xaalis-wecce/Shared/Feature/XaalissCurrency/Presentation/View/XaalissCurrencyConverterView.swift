  //
  //  XaalissCurrencyConverterView.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import SwiftUI

struct XaalissCurrencyConverterView: View {
  @ObservedObject var viewModel = XaalisWecceViewModel()
  @State private var price = "1"
  @State private var showKeyboard: Bool = false
  @State private var showingSheet = false
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomLeading) {
        CurrencyButtonView(currencies: $viewModel.currencies, selection: $viewModel.selectedTab, price: $price)
        VStack {
          HStack {
            Text(price)
              .font(.body)
              .fontWeight(.bold)
              .padding(10)
              .foregroundColor(.blue)
              .frame(maxWidth: .infinity, maxHeight: 50)
            Image(systemName: self.showKeyboard ? "keyboard.chevron.compact.down" : "keyboard")
              .foregroundColor(.blue)
              .font(.system(size: 30, weight: .medium))
              .onTapGesture {
                self.showKeyboard.toggle()
              }
          }
          if showKeyboard {
            KeyPad(string: $price)
              .padding()
          }
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 25).background(.ultraThinMaterial)
        )
        .padding([.leading, .trailing])
        .task {
          self.viewModel.getCurrenciesList(base: "CAD")
        }
        
        .frame(width: .infinity, height: self.showKeyboard ? 400 : 100)
      }
      .sheet(isPresented: $showingSheet) {
        SymbolListView()
      }
      .navigationTitle("Wecceku Xaaliss")
      .navigationBarItems(trailing: Button(action: { showingSheet = true }, label: {
        Image(systemName: "plus.circle.fill")
          .foregroundColor(.blue)
          .font(.system(size: 30, weight: .ultraLight))
      }))
      .edgesIgnoringSafeArea(.bottom)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct XaalissCurrencyConverterView_Previews: PreviewProvider {
  static var previews: some View {
    XaalissCurrencyConverterView()
  }
}
