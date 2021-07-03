  //
  //  XaalisWecceViewModel.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 24/02/2021.
  //

import Foundation
import Combine

class XaalisWecceViewModel: ObservableObject, LoadableObject {
  var state: LoadingState<Currency> = .idle

  func load() {
    chooseRate(rate: currencies.currenciesRate[self.selectedTab])
  }

  typealias Output = Currency

  var selectedTab: Int = 0 {
    didSet {
      chooseRate(rate: currencies.currenciesRate[self.selectedTab])
    }
  }
  var currencyRemoteDataSource = CurrencyRemoteDataSource()
  var currencyLocalDataSource = CurrencyLocalDataSource()
  @Published var currencies: Currency = Currency(success: true, base: "XOF", date: "12/12/2021", rates: ["howdy": 1.0])
func chooseRate(rate: CurrencyRate) {
  let base = rate.name
  getCurrenciesList(base: base)
}
  func getCurrenciesList(base: String) {
    state = .loading
    let allCurrency: [CurrencyModel] = currencyLocalDataSource.getAllLocalCurrency()
    let arraySymbols = allCurrency.map { String($0.code ?? "")}
    let symbols = arraySymbols.joined(separator: ",")
    currencyRemoteDataSource.getCurrencyList(base: base, symbols: symbols) { result in
      switch result {
      case .success(let currency):
        self.currencies = currency
        self.state = .loaded(currency)

      case .failure(let error):
        self.state = .failed(error)
        print(error)
      }
    }
  }
}
