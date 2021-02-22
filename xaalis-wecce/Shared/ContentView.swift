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
    var body: some View {
           VStack {
               HStack {
                   Spacer()
                   Text(string)
                    .fill(Color.offWhite)
               }.padding([.leading, .trailing])
               
               Divider()
               KeyPad(string: $string)
           }
           .font(.largeTitle)
               .padding()
       }

       @State private var string = "0"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                    ContentView()
                }
    }
}
