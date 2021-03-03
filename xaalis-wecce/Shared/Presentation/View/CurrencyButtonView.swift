//
//  CurrencyButtonView.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 24/02/2021.
//

import SwiftUI

struct CurrencyButtonView: View {
    private let date: String
    private let price: Double
    private let rate: CurrencyRate
    @State var buttonStyle = SelectableButtonStyle()
    @State  var isSelected = false
    init(date: String, rate: CurrencyRate, price: Double) {
        self.date = date
        self.price = price
        self.rate = rate
    }
    var body: some View {
        let priceCurrency = Double(rate.price) * Double(price)
        Button(action: {
            self.isSelected = !self.isSelected
            print("isSelected now is \(self.isSelected ? "true" : "false")")
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0, style: .continuous)
                    .fill(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: self.isSelected ? 10.0 : 10.0))
                    .overlay(RoundedRectangle(cornerRadius: self.isSelected ? 10.0 : 10.0).stroke(lineWidth: self.isSelected ? 2.0 : 0.0).foregroundColor(Color.pink))
                    .animation(.linear)
                    .shadow(radius: 10)
                VStack {
                    Text(rate.name)
                        .font(.system(size: 15))
                        .foregroundColor(Color.red)
                    Spacer()
                    Text("\(priceCurrency, specifier: "%.2f") \(rate.symbol)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    Spacer()
                    Text(date)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                }
                . padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

//struct CurrencyButtonView_Previews: PreviewProvider {
//    static var previews: some View {
////        CurrencyButtonView()
//    }
//}
