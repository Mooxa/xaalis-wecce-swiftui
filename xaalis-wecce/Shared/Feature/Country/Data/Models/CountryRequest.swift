//
//  CountryRequest.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

protocol CountryRequest {
    func getCountryList(completion: @escaping (Result<Currency, NetworkRequestError>) -> Void)
}
