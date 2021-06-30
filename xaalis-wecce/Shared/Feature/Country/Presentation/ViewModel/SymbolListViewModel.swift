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

  @Published var countries: [Country] = [ ]
  func fetchCountry() {
    countryRemoteDataSource.getCountryList { result in
      switch result {
      case .success(let countries):
        self.countries = countries
      case .failure(let error):
        print(error)
      }
    }
  }
}
