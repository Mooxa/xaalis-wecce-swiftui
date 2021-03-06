  //
  //  CountryRemoteDataSource.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation
import Combine

final class CurrencyListRemoteDataSource: CountryRequest {

  let apiClient = APIClient()
  var cancellables = Set<AnyCancellable>()

  func getCountryList(completion: @escaping (Result<Currency, NetworkRequestError>) -> Void) {
    let cancellable =  apiClient.dispatch(CountryEndpoint())
      .sink(receiveCompletion: { result in
        switch result {
        case .failure(let error):
          completion(.failure(error))
          print("Handle error: \(error)")
        case .finished:
          break
        }
      }, receiveValue: {(countries) in
        completion(.success(countries))
      })
    cancellables.insert(cancellable)

  }

}
