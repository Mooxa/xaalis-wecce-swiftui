//
//  CurrencyEndpoint.swift
//  xaalis-wecce (iOS)
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation

struct CurrencyEndpoint: Request {
  typealias ReturnType = Currency
  var parameters: [URLQueryItem]?
  var path: String = "/latest"
  var method: HTTPMethod = .get
  var body: [String: Any]?
  init(parameters: [URLQueryItem]?) {
    self.parameters = parameters
  }
}
