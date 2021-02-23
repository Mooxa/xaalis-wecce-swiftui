//
//  ContentView.swift
//  Shared
//
//  Created by Mouhamed Dieye on 22/02/2021.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct ContentView: View {
    var column = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    @State private var isToggled = false

    
    private var currencies: [Currency] = {
        let euros = Currency(id: UUID().uuidString, currencyName: "EUR €", currencyPrice: 654.86, date: "23/02/2021")
        let xof = Currency(id: UUID().uuidString, currencyName: "XOF ", currencyPrice: 1, date: "23/02/2021")
        let yen = Currency(id: UUID().uuidString, currencyName: "CNY ¥", currencyPrice: 83.45, date: "23/02/2021")
        let dollar = Currency(id: UUID().uuidString, currencyName: "USD $", currencyPrice: 539.00, date: "23/02/2021")
        let cad = Currency(id: UUID().uuidString, currencyName: "CAD $", currencyPrice: 428.08, date: "23/02/2021")
        let pound = Currency(id: UUID().uuidString, currencyName: "GBP £", currencyPrice: 760.80, date: "23/02/2021")
        
        return [euros, xof, yen, dollar, cad, pound]
    }()

    
    var body: some View {
        ZStack {
            Color.neuBackground
            VStack{
                ScrollView {
                    LazyVGrid(columns: column, spacing: 10){
                        ForEach(self.currencies){ currency in
                            VStack(spacing: 40) {
//                                Button(action: {
//                                    print("Button tapped")
//                                }) {
//                                    VStack {
//                                        Text("Euros")
//                                            .font(.system(size: 15))
//                                            .foregroundColor(.black)
//                                        Spacer()
//                                        Text("200")
//                                            .font(.system(size: 20))
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.black)
//                                        Spacer()
//                                        Text("23/02/2020")
//                                            .font(.system(size: 10))
//                                            .foregroundColor(.black)
//                                    }
//                                    . padding()
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                }
//                                .buttonStyle(ColorfulButtonStyle())
                                let priceCurrency = Double(currency.currencyPrice) * Double(price)!
                                Toggle(isOn: $isToggled) {
                                    VStack {
                                        Text(currency.currencyName)
                                            .font(.system(size: 15))
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("\(priceCurrency, specifier: "%.2f")")
                                            .font(.system(size: 10))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(currency.date)
                                            .font(.system(size: 10))
                                            .foregroundColor(.black)
                                    }
                                    . padding()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .toggleStyle(ColorfulToggleStyle())
                                
                            }
                        }
                    }
                    .padding()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 260)
                HStack() {
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
                KeyPad(string: $price)
                    .padding()
            }
            .background(Color.neuBackground)
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
