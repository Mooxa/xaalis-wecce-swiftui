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
                CurrencyGridView(currencies: $viewModel.currencies, selection: $viewModel.selectedTab, price: $price)
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
