//
//  ContentView.swift
//  Shared
//
//  Created by Mouhamed Dieye on 22/02/2021.
//

import SwiftUI
import Combine
struct ContentView: View {
    @ObservedObject var viewModel = XaalisWecceViewModel()
    @State private var price = "1"
    
    var body: some View {
        
        ZStack {
            Color.white
            VStack{
                
                CurrencyGridView(currencies: $viewModel.currencies, selection: $viewModel.selectedTab, price: Double(price) ?? 1) {
                    rate, isSelected in
                   
                }
                .padding()
//                CurrencyGridView(currencies: $viewModel.currencies, selection: , price: Double(price) ?? 1) { rate, isSelected in
//                    let priceCurrency = Double(rate.price) * Double(price)
//                    ZStack {
//                        RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0, style: .continuous)
//                            .fill(Color.white)
//                            .clipShape(RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0))
//                            .overlay(RoundedRectangle(cornerRadius: isSelected ? 10.0 : 10.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(Color.green))
//                            .animation(.linear)
//                            .shadow(radius: 10)
//                        VStack {
//                            Text(rate.name)
//                                .font(.system(size: 15))
//                                .foregroundColor(Color.red)
//                            Spacer()
//                            Text("\(priceCurrency, specifier: "%.2f") \(rate.symbol)")
//                                .font(.system(size: 20))
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.blue)
//                            Spacer()
//                            Text(currencies.date)
//                                .font(.system(size: 10))
//                                .foregroundColor(.black)
//                        }
//                        
//                        . padding()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    }
//                }
                HStack {
                    Spacer()
                    Text(price)
                        .padding(10)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.neuBackground))
                        .shadow(color: .dropShadow, radius: 15, x: -15, y: -15)
                        .shadow(color: .dropLight, radius: 15, x: 15, y: 15)
                }
                .padding(10)
                .padding([.leading, .trailing])
                .onAppear {
                    self.viewModel.fetchData()
                }
                KeyPad(string: $price)
                    .padding()
            }
            .font(.largeTitle)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
