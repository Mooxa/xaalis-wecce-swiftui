  //
  //  SymbolListViewModel.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 21/06/2021.
  //

import Foundation
import Combine

class SymbolListViewModel: ObservableObject {
  var countryRemoteDataSource = CountryRemoteDataSource()
  var currencyLocalDataSource = CurrencyLocalDataSource()
  @Published var allCurrencies: [CurrencyRate] = []
  
  func fetchCountry() {
    countryRemoteDataSource.getCountryList { result in
      switch result {
      case .success(let allCurrencies):
        self.allCurrencies = allCurrencies.currenciesRate
      case .failure(let error):
        print(error)
      }
    }
  }
  func getCurrencyName(_ code: String) -> String? {
    let locale: Locale = .current
    let currency = locale.localizedString(forCurrencyCode: code)
    return currency
  }

  func saveCurrencyLocally(currencyName: String, currencyCode: String) {
    currencyLocalDataSource.addCurrency(currencyName: currencyName, currencyCode: currencyCode)
  }
  
  func isSaving(code: String) -> Bool {
    guard currencyLocalDataSource.getOneCurrency(by: code) != nil else { return false}
    return true
  }
}
