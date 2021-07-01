//
//  CountryEndpoint.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

struct CountryEndpoint: Request {
  var parameters: [URLQueryItem]?
  typealias ReturnType = Currency
  var path: String = "/latest"
  var method: HTTPMethod = .get
}
