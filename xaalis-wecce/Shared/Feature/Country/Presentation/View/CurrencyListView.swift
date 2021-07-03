  //
  //  SymbolListView.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 21/06/2021.
  //

import SwiftUI

struct CurrencyListView: View {
  @ObservedObject var viewModel = CurrencyListViewModel()
  @State var selected: Bool  = false
  @Environment(\.dismiss) var dismiss
  @State private var searchText = ""
  @EnvironmentObject var viewlaunch: ViewLaunch

  var body: some View {
    NavigationView {
      List(searchResults, id: \.name) { currency in
        CurrencyRow(currency: currency) { currencyName, currencyCode in
          viewModel.saveCurrencyLocally(currencyName: currencyName, currencyCode: currencyCode)
        }
      }
      .navigationBarTitle("Choose Currency", displayMode: .inline)
      .navigationBarItems(leading: Button(action: {
        self.viewlaunch.currentPage = "ContentView"
        dismiss()
      }, label: {
        Image(systemName: "multiply.circle.fill")
          .foregroundColor(.blue)
          .font(.system(size: 20, weight: .ultraLight))
      }), trailing: Button(action: {
        
      }, label: {
        Text("Save")
          .foregroundColor(.blue)
          .font(.system(size: 20, weight: .light))
      })
      )
      .task {
        viewModel.fetchCountry()
      }
      .refreshable {
        viewModel.fetchCountry()
      }
      .searchable(text: $searchText) {
        ForEach(searchResults, id: \.name) { result in
          Text("Are you looking for \(result.name)?").searchCompletion(result.name)
        }
      }

    }
  }
  var searchResults: [CurrencyRate] {
    if searchText.isEmpty {
      return viewModel.allCurrencies
    } else {
      return viewModel.allCurrencies.filter { $0.name.contains(searchText) }
    }
  }
}

struct SymbolListView_Previews: PreviewProvider {
  static var previews: some View {
    CurrencyListView()
  }
}
