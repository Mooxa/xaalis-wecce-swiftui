//
  //  CurrencyRemoteDataSource.swift
  //  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation
import Combine
final class CurrencyRemoteDataSource: CurrencyRequest {
  let apiClient = APIClient()
  var cancellables = Set<AnyCancellable>()
  func getCurrencyList(base: String, completion: @escaping (Result<Currency, NetworkRequestError>) -> Void) {
    var parameters: [URLQueryItem] {
      return [URLQueryItem(name: "base", value: base),
              URLQueryItem(name: "symbols", value: "CAD,EUR,GBP,CNY,USD,XOF,AED,CHF,CNH,CVE,QAR,TND,NGN")
      ]
    }
    let cancellable =  apiClient.dispatch(CurrencyEndpoint(parameters: parameters))
      .sink(receiveCompletion: { result in
        switch result {
        case .failure(let error):
          completion(.failure(error))
          print("Handle error: \(error)")
        case .finished:
          break
        }
      }, receiveValue: {(currencies) in
        completion(.success(currencies))
      })
    cancellables.insert(cancellable)
  }
}
