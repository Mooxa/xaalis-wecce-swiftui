//
//  CurrencybuttonChartView.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 21/06/2021.
//

import SwiftUI

struct CurrencybuttonChartView: View {
@Binding var rate: CurrencyRate
  @Binding var price: String

    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
          .fill(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 10.0))
          .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2.0).foregroundColor(Color.blue))
          .shadow(radius: 10)
        VStack {
          Text(rate.name.getCurrencyName() ?? rate.name)
            .font(.system(size: 15))
            .foregroundColor(Color.red)
          Spacer()
          HStack(alignment: .top) {
            Text("\(String(format: "%.2f", Double(rate.price) * (Double(price) ?? 1)))")
              .font(.system(size: 60))
              .fontWeight(.light)
              .foregroundColor(Color.blue)
            Text("\(rate.name.getSymbolForCurrencyCode() ?? "")")
              .font(.system(size: 30))
              .foregroundColor(Color.blue)
          }
//          Text("\(priceCurrency)")
//            .font(.system(size: 20))
//            .fontWeight(.bold)
//            .foregroundColor(Color.blue)
          Spacer()
          Text("\(Date.now)")
            .font(.system(size: 10))
            .foregroundColor(.black)
        }
        . padding()
        .frame(width: .infinity, height: 150)
      }
      .frame(width: .infinity, height: 150)

    }
}

// struct CurrencybuttonChartView_Previews: PreviewProvider {
//    static var previews: some View {
//      CurrencybuttonChartView(rate: CurrencyRate(name: "XOF", price: 250.00))
//    }
// }
