  //
  //  SymbolListViewModel.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 21/06/2021.
  //

import Foundation
import Combine

class CurrencyListViewModel: ObservableObject {
  var currencyListRemoteDataSource = CurrencyListRemoteDataSource()
  var currencyLocalDataSource = CurrencyLocalDataSource()
  @Published var allCurrencies: [CurrencyRate] = []
  
  func fetchCountry() {
    currencyListRemoteDataSource.getCountryList { result in
      switch result {
      case .success(let allCurrencies):
        self.allCurrencies = allCurrencies.currenciesRate
      case .failure(let error):
        print(error)
      }
    }
  }

  func saveCurrencyLocally(currencyName: String, currencyCode: String) {
    currencyLocalDataSource.addCurrency(currencyName: currencyName, currencyCode: currencyCode)
  }
  
  func isSaving(code: String) -> Bool {
    guard currencyLocalDataSource.getOneCurrency(by: code) != nil else { return false}
    return true
  }
}
