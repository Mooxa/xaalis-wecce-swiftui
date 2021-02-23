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
    let data = (1...6).map { "\($0)" }
    var column = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: column, spacing: 10){
                        ForEach(self.data, id: \.self){ data in
                            Text(data)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                .background(Color.offWhite)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        }
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: 200)
            HStack() {
                Spacer()
                Text(string)
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.offWhite))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
            .padding(10)
            .padding([.leading, .trailing])
            KeyPad(string: $string)
                .padding()
        }
        .background(Color.offWhite)
        .font(.largeTitle)
        
        
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
