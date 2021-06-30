//
//  Symbol.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 21/06/2021.
//

import Foundation

  // MARK: - Symbols
struct Symbols: Codable, Equatable {
  let motd: MOTD
  let success: Bool
  let symbols: [String: Symbol]
}

  //
  // Hashable or Equatable:
  // The compiler will not be able to synthesize the implementation of Hashable or Equatable
  // for types that require the use of JSONAny, nor will the implementation of Hashable be
  // synthesized for types that have collections (such as arrays or dictionaries).

  // MARK: - MOTD
struct MOTD: Codable, Equatable {
  let msg: String
  let url: String
}

  //
  // Hashable or Equatable:
  // The compiler will not be able to synthesize the implementation of Hashable or Equatable
  // for types that require the use of JSONAny, nor will the implementation of Hashable be
  // synthesized for types that have collections (such as arrays or dictionaries).

  // MARK: - Symbol
struct Symbol: Codable, Equatable {
  let symbolDescription, code: String
  enum CodingKeys: String, CodingKey {
    case symbolDescription = "description"
    case code
  }
}
