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
    private var rate: CurrencyRate
    @State  var isSelected = false
    var viewModel: Binding<XaalisWecceViewModel>
    //    @State var buttonStyle = SelectableButtonStyle()
    
    init(date: String, rate: CurrencyRate, price: Double, viewModel: Binding<XaalisWecceViewModel>) {
        self.date = date
        self.price = price
        self.rate = rate
        self.viewModel = viewModel
    }
    var body: some View {
        let priceCurrency = Double(rate.price) * Double(price)
        
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: rate.isSelected ? 10.0 : 10.0, style: .continuous)
                    .fill(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: rate.isSelected ? 10.0 : 10.0))
                    .overlay(RoundedRectangle(cornerRadius: rate.isSelected ? 10.0 : 10.0).stroke(lineWidth: self.isSelected ? 2.0 : 0.0).foregroundColor(Color.green))
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
                .onTapGesture {
                    print("0 rate chosen \(rate)")
                    viewModel.chooseRate(rate: rate)
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
