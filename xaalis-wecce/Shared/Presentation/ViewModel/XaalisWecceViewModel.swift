//
//  XaalisWecceViewModel.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 24/02/2021.
//

import Foundation
import Combine
enum DataTaskError: Error {
    case invalidResponse, rateLimitted, serverBusy
}

class XaalisWecceViewModel: ObservableObject {
    private let url = "https://api.exchangerate.host/latest?base=XOF&symbols=CAD,EUR,GBP,CNY,USD,XOF"
    @Published private(set) var  rates = [CurrencyRate]()
    var selectedTab : Int = 0 {
        didSet {
            chooseRate(rate: currencies.currenciesRate[self.selectedTab])
        }
    }
    private var base: String? = "CAD"
    var currency = PassthroughSubject<Currencies, Never>()
    var subscriptions = [AnyCancellable]()
    @Published var currencies =
    Currencies(base:  "CAD", date: "2021-02-25", rates: Rate(cad: 1, cny: 1, eur: 1, gbp: 1, usd: 1, xof: 1, aed: 1, chf: 1, cnh: 1, cve: 1, qar: 1, tnd: 1, ngn: 1))
    
    func calculPriceCurrency(currencyPrice: Double, inputPrice: Double) -> Double {
        let priceCurrency = Double(currencyPrice) * Double(inputPrice)
        return priceCurrency == 0 ? currencyPrice : priceCurrency
    }
    
    func chooseRate(rate: CurrencyRate) {
        base = rate.name
        fetchData()
    }
    
    func fetchData() {
        guard let baseCurrency = base else {
            return
        }
        let url = "https://api.exchangerate.host/latest?base=\(baseCurrency)&symbols=CAD,EUR,GBP,CNY,USD,XOF,AED,CHF,CNH,CVE,QAR,TND,NGN"
        
        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: Currencies.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print(completion) // finished
            }) { [self] currency in
                rates = currency.currenciesRate
                currencies = currency
            }.store(in: &subscriptions)
        
    }
    
    
}
