  //
  //  SymbolListView.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 21/06/2021.
  //

import SwiftUI

struct SymbolListView: View {
  @ObservedObject var viewModel = SymbolListViewModel()
  @State var selected: Bool  = false
  @Environment(\.dismiss) var dismiss
  @State private var searchText = ""
  @EnvironmentObject var viewlaunch: ViewLaunch

  var body: some View {
    NavigationView {
      List(searchResults, id: \.name) { currency in
        SymbolRow(currency: currency) { currencyName, currencyCode in
          viewModel.saveCurrencyLocally(currencyName: currencyName, currencyCode: currencyCode)
        }
      }
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
      .navigationTitle("Choose Currency")
      .toolbar {
        Button("Save") {
          self.viewlaunch.currentPage = "ContentView"
          dismiss()
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
    SymbolListView()
  }
}
