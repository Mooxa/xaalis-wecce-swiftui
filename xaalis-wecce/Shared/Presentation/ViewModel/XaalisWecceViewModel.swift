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
    @Published var breweries: Currencies?
    private var task: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    private(set) var  rates = [CurrencyRate]()

    var currency = PassthroughSubject<Currencies, Never>()
    var subscriptions = [AnyCancellable]()
    @Published var currencies = Currencies(base: "CAD", date: "2021-02-25", rates: Rate(cad: 1.0, cny: 5.159445, eur: 0.6567, gbp: 0.564736, usd: 0.799827, xof: 430.766776))
    
    func calculPriceCurrency(currencyPrice: Double, inputPrice: Double) -> Double {
        let priceCurrency = Double(currencyPrice) * Double(inputPrice)
        return priceCurrency == 0 ? currencyPrice : priceCurrency
    }
    
    
    func fetchData(base:String?) {
        guard let baseCurrency = base else {
            return
        }
        let url = "https://api.exchangerate.host/latest?base=\(baseCurrency)&symbols=CAD,EUR,GBP,CNY,USD,XOF"

        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
        .map { $0.data }
        .decode(type: Currencies.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          print(completion) // finished
        }) { [self] currency in
            rates = currency.rates.convertToArray()
            currencies = currency
            print(currency)
        }.store(in: &subscriptions)
      
    }
    
    
}
