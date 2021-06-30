  //
  //  Country.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 23/06/2021.
  //

import Foundation

  // MARK: - Country
struct Country: Decodable, Equatable {
  let name: String
  let alpha2Code, alpha3Code: String
  let currencies: [CurrencyCountry]
  let flag: String
}

struct CurrencyCountry: Decodable, Equatable {
  let code, name, symbol: String?
}
