//
//  ContentView.swift
//  Shared
//
//  Created by Mouhamed Dieye on 22/02/2021.
//

import SwiftUI

struct ContentView: View {
    private var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]

    @State private var isToggled = false
    @ObservedObject var viewModel = XaalisWecceViewModel()
    
    var body: some View {
        ZStack {
            Color.white
            VStack{
                ScrollView {
                    LazyVGrid(columns: flexibleLayout, spacing: 10) {
                        ForEach(viewModel.rates) { currency in
                            CurrencyButtonView(date: viewModel.currencies.date, rate: currency, price: Double(price) ?? 0.0)
                        }
                    }.padding()
                }
                .frame(width: .infinity, height: 360)
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
                    self.viewModel.fetchData(base: "XOF")
                }
                KeyPad(string: $price)
                    .padding()
            }
            .font(.largeTitle)
        }
    }
    
    @State private var price = "0"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
