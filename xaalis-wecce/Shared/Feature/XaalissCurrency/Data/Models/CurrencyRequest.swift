//
//  CurrencyRequest.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

protocol CurrencyRequest {
  func getCurrencyList(base: String, symbols: String, completion: @escaping (Result<Currency, NetworkRequestError>) -> Void)
}
