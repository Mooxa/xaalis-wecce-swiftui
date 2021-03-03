//
//  Currency.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 23/02/2021.
//

import Foundation

enum CurrencyFormat {
    case cad
    case cny
    case eur
    case gbp
    case usd
    case xof
    
    //    switch self {
    //    case .cad : return ("CAD", "$")
    //    case .cny : return ("CNY", "¥")
    //    case .eur: return ("EUR","€")
    //    case .gbp: return ("GBP","£")
    //    case .usd: return ("USD","$")
    //    case .xof: return ("XOF")
    //    default: return .unknown
    //    }
}
extension CurrencyFormat{
    
}

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

struct Currencies{
    var base: String
    var date: String
    var rates: Rate

    
}
struct CurrencyRate: Identifiable {
    var id = UUID()
    var name:String
    var price: Double
    var symbol: String
}

struct Rate {
    let cad: Double
    let cny: Double
    let eur: Double
    let gbp: Double
    let usd: Double
    let xof: Double
    
    func convertToArray() -> [CurrencyRate] {
        var currencyRate = [CurrencyRate]()
        currencyRate.append(CurrencyRate(name: "CAD", price: self.cad, symbol:"$"))
        currencyRate.append(CurrencyRate(name: "CNY", price: self.cny, symbol:"¥"))
        currencyRate.append(CurrencyRate(name: "EUR", price: self.eur, symbol:"€"))
        currencyRate.append(CurrencyRate(name: "GBP", price: self.gbp, symbol:"£"))
        currencyRate.append(CurrencyRate(name: "USD", price: self.usd, symbol:"$"))
        currencyRate.append(CurrencyRate(name: "XOF", price: self.xof, symbol:"F"))
        return currencyRate
    }
    
    
    
}

