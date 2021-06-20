//
//  CurrencyButtonView.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 24/02/2021.
//

import SwiftUI

struct CurrencyButtonView: View {
    @State var price: Double
    @State var rate: CurrencyRate
    @State var isSelected: Bool
    

    var body: some View {
        let priceCurrency = Double(rate.price) * Double(price)
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
                Text("\(priceCurrency, specifier: "%.2f") \(rate.symbol)")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                Spacer()
            }
            
            . padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}



//struct CurrencyButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//       CurrencyButtonView()
//    }
//}
