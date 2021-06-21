//
//  Currency+Codable.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 25/02/2021.
//

import Foundation

extension Currencies: Decodable {
    
    enum CodingKeys: String, CodingKey  {
        case base, date, rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.base = try container.decode(String.self, forKey: .base)
        self.date = try container.decode(String.self, forKey: .date)
        self.rates = try container.decode(Rate.self, forKey: .rates)
    }
    
}

extension Rate: Decodable {
    enum CodingKeys: String, CodingKey  {
        case cad = "CAD"
        case cny = "CNY"
        case eur = "EUR"
        case gbp = "GBP"
        case usd = "USD"
        case xof = "XOF"
        case aed = "AED"
        case chf = "CHF"
        case cnh = "CNH"
        case cve = "CVE"
        case qar = "QAR"
        case tnd = "TND"
        case ngn = "NGN"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cad = try container.decode(Double.self, forKey: .cad)
        self.cny = try container.decode(Double.self, forKey: .cny)
        self.eur = try container.decode(Double.self, forKey: .eur)
        self.gbp = try container.decode(Double.self, forKey: .gbp)
        self.usd = try container.decode(Double.self, forKey: .usd)
        self.xof = try container.decode(Double.self, forKey: .xof)
        self.aed = try container.decode(Double.self, forKey: .aed)
        self.chf = try container.decode(Double.self, forKey: .chf)
        self.cnh = try container.decode(Double.self, forKey: .cnh)
        self.cve = try container.decode(Double.self, forKey: .cve)
        self.qar = try container.decode(Double.self, forKey: .qar)
        self.tnd = try container.decode(Double.self, forKey: .tnd)
        self.ngn = try container.decode(Double.self, forKey: .ngn)
    }
}
