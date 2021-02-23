//
//  Currency.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 23/02/2021.
//

import Foundation


struct Currency: Identifiable {
    var id: String
    var currencyName: String
    var currencyPrice: Double
    var date: String
    init(id: String, currencyName: String, currencyPrice: Double, date: String) {
        self.id = id
        self.currencyName = currencyName
        self.currencyPrice = currencyPrice
        self.date = date
    }
}
