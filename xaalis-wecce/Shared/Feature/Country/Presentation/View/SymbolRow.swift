  //
  //  SymbolRow.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 23/06/2021.
  //

import SwiftUI

struct SymbolRow: View {
  let country: Country
  var body: some View {
    HStack(alignment: .top) {
      AsyncImage(url: URL(string: country.flag)!) { phase in
        if let image = phase.image {
          image
            .resizable()
        } else if phase.error != nil {
          Color.red // Indicates an error.
        } else {
          Color.blue // Acts as a placeholder.
        }
      }
      .clipShape(Circle())
      .frame(width: 50, height: 50)
      .overlay(Text(country.alpha3Code)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
                .font(.system(size: 20, weight: .heavy)))
      VStack(alignment: .leading) {
        Text(country.name)
          .font(.headline)
          .multilineTextAlignment(.leading)
        Text("\(country.currencies[0].code ?? "NONE") ")
          .foregroundColor(.secondary)
      }
      Spacer()
      Image(systemName: "plus.circle")
        .foregroundColor(.blue)
        .font(.system(size: 25))
    }
    .padding(6)
  }
}

struct SymbolRow_Previews: PreviewProvider {
  static var previews: some View {
    SymbolRow(country:
                Country(name: "Senegal",
                        alpha2Code: "SN", alpha3Code: "SEN",
                        currencies:
                          [CurrencyCountry(code: "XOF",
                                           name: "West African CFA franc",
                                           symbol: "Fr")],
                        flag: "https://restcountries.eu/data/sen.svg"))
  }
}
