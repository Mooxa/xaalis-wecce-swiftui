//
//  CurrencyButtonView.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 24/02/2021.
//

import SwiftUI

struct CurrencyButtonView: View {
    @Binding var currencies: Currencies //
    @Binding var selection: Int // Currently selected tab
    @Binding var price: String
    var body: some View {
        let flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
        
        ScrollView {
            LazyVGrid(columns: flexibleLayout, spacing: 10) {
                ForEach(currencies.currenciesRate, id: \.name) { currency in
                    self.itemView(rate: currency)
                }
            }.padding()
        }
    }
    
    private func itemView(rate: CurrencyRate) -> some View {
        let index = self.currencies.currenciesRate.firstIndex(of: rate)!
        let isSelected = index == selection
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.currencyCode = rate.name
        formatter.maximumFractionDigits = 2
        let priceCurrency =
        formatter.string(from: NSNumber(value: Double(rate.price) * (Double(price) ?? 1 ))) ?? "$0"
        return Button(action: {
            // Allows for animated transitions of the underline,
            // as well as other views on the same screen
            withAnimation {
                self.selection = index
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0, style: .continuous)
                    .fill(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0))
                    .overlay(RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(Color.blue))
                    .animation(.linear)
                    .shadow(radius: 10)
                VStack {
                    Text(rate.name)
                        .font(.system(size: 15))
                        .foregroundColor(Color.red)
                    Spacer()
                    Text("\(priceCurrency)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    Spacer()
                    Text(currencies.date)
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
//       CurrencyButtonView()
//    }
//}
