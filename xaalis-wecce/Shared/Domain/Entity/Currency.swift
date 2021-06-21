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

struct Currencies {
    var base: String
    var date: String
    var rates: Rate
    var currenciesRate: [CurrencyRate]  {
        return rates.convertToArray()
    }
    
    
}
class CurrencyRate: Identifiable, Equatable {
    var name: String
    var price: Double
    var symbol: String
    init(name: String, price: Double, symbol: String){
        self.name = name
        self.price = price
        self.symbol = symbol
    }
    
    static func == (lhs: CurrencyRate, rhs: CurrencyRate) -> Bool {
        return lhs.name == rhs.name
    }
    
}

struct Rate {
    let cad: Double
    let cny: Double
    let eur: Double
    let gbp: Double
    let usd: Double
    let xof: Double
    let aed: Double
    let chf: Double
    let cnh: Double
    let cve: Double
    let qar: Double
    let tnd: Double
    let ngn: Double
    func convertToArray() -> [CurrencyRate] {
        var currencyRate = [CurrencyRate]()
        currencyRate.append(CurrencyRate(name: "CAD", price: self.cad, symbol:"$"))
        currencyRate.append(CurrencyRate(name: "CNY", price: self.cny, symbol:"¥"))
        currencyRate.append(CurrencyRate(name: "EUR", price: self.eur, symbol:"€"))
        currencyRate.append(CurrencyRate(name: "GBP", price: self.gbp, symbol:"£"))
        currencyRate.append(CurrencyRate(name: "USD", price: self.usd, symbol:"$"))
        currencyRate.append(CurrencyRate(name: "XOF", price: self.xof, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "AED", price: self.xof, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "CHF", price: self.chf, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "CNH", price: self.cnh, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "CVE", price: self.cve, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "QAR", price: self.qar, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "TND", price: self.tnd, symbol:"F"))
        currencyRate.append(CurrencyRate(name: "NGN", price: self.ngn, symbol:"F"))
        return currencyRate
    }
}

//enum RateType: CaseIterable {
//    case CAD(cad, Double),
//         case EUR(eur, Double),GBP,CNY,USD,XOF,AED,CHF,CNH,CVE,QAR,TND,NGN
//}

