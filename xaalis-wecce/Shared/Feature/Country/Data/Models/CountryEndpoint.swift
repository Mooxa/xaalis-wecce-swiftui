//
//  CountryEndpoint.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

struct CountryEndpoint: Request {
  var parameters: [URLQueryItem]?
  typealias ReturnType = [Country]
  var path: String = "/rest/v2/all"
  var method: HTTPMethod = .get
}
