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
    @State private var showKeyboard: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                CurrencyButtonView(currencies: $viewModel.currencies, selection: $viewModel.selectedTab, price: $price)
                VStack{
                    HStack{
                        Text(price)
                            .padding(10)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .background(RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.neuBackground))
                            .shadow(color: .dropShadow, radius: 15, x: -15, y: -15)
                            .shadow(color: .dropLight, radius: 15, x: 15, y: 15)
                        
                        Image(systemName:  self.showKeyboard ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                            .foregroundColor(.blue)
                            .frame(width: 60, height: 60)
                            .onTapGesture {
                                self.showKeyboard.toggle()
                            }
                        
                        
                    }
                    
                    if showKeyboard{
                        KeyPad(string: $price)
                            .padding()
                    }
                }
                
                .padding(10)
                .padding([.leading, .trailing])
                .background( Blur(style: .systemUltraThinMaterial))
                .onAppear {
                    self.viewModel.fetchData()
                }
                .frame(width: .infinity, height: self.showKeyboard ? 400 : 100)
                
                Spacer()
                
            }
            .navigationTitle("Wecceku Xaaliss")
            .navigationBarItems(trailing:
                                    Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue))
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
