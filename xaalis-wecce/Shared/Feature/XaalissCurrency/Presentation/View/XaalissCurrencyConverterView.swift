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
  @State var selection: Int?
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    AsyncContentView(source: viewModel) { currencies in
      NavigationView {
        ZStack(alignment: .bottomLeading) {
          CurrencyButtonView(currencies: $viewModel.currencies, selection: $viewModel.selectedTab, price: $price)
            .gesture(
              DragGesture().onChanged { _ in
              self.showKeyboard.toggle()
            })
          NavigationLink(destination: CurrencyListView()
                          .navigationBarTitle("")
                          .navigationBarHidden(true), tag: 1, selection: $selection) {
            EmptyView()
          }
                          .frame(width: 0, alignment: .center).opacity(0.0)
          VStack {
            HStack {
              Text(price)
                .font(.title)
                .fontWeight(.light)
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
            RoundedRectangle(cornerRadius: 25).background(.thinMaterial)
              .foregroundColor(.white)
          )
          .padding([.leading, .trailing])
          .task {
            self.viewModel.getCurrenciesList(base: "CAD")
          }

          .frame(width: UIScreen.main.bounds.width, height: self.showKeyboard ? 400 : 100)
        }
        .navigationTitle("Wecceku Xaaliss")
        .navigationBarItems(trailing:
                              Button(action: {
          self.selection = 1 }, label: {
            Image(systemName: "plus.circle.fill")
              .foregroundColor(.blue)
              .font(.system(size: 30, weight: .ultraLight))
          }))
      }
    }


  }
}

struct XaalissCurrencyConverterView_Previews: PreviewProvider {
  static var previews: some View {
    XaalissCurrencyConverterView()
  }
}
