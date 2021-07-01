  //
  //  XaalisWecceViewModel.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 24/02/2021.
  //

import Foundation
import Combine

class XaalisWecceViewModel: ObservableObject {
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
    let allCurrency: [CurrencyModel] = currencyLocalDataSource.getAllLocalCurrency()
    let arraySymbols = allCurrency.map { String($0.code ?? "")}
    let symbols = arraySymbols.joined(separator: ",")
    print(symbols)
    currencyRemoteDataSource.getCurrencyList(base: base, symbols: symbols) { result in
      switch result {
      case .success(let currency):
        self.currencies = currency
      case .failure(let error):
        print(error)
      }
    }
  }
}
