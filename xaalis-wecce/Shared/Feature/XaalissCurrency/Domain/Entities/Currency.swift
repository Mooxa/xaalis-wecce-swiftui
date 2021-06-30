//
  //  Currency.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 23/02/2021.
  //

import Foundation

  // MARK: - Currency
struct Currency: Decodable {
  let success: Bool
  let base, date: String
  let rates: [String: Double]
  var currenciesRate: [CurrencyRate] {
    var currencyRate = [CurrencyRate]()
    for (key, value) in rates {
      currencyRate.append(CurrencyRate(name: key, price: value))
    }
    return currencyRate
  }
}

class CurrencyRate: Identifiable, Equatable {
  var name: String
  var price: Double
  init(name: String, price: Double) {
    self.name = name
    self.price = price
  }
  static func == (lhs: CurrencyRate, rhs: CurrencyRate) -> Bool {
    return lhs.name == rhs.name
  }
}
