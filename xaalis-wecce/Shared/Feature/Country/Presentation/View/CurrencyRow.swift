  //
  //  SymbolRow.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 23/06/2021.
  //

import SwiftUI

struct CurrencyRow: View {
  let currency: CurrencyRate
  @State var selected: Bool = false
  @ObservedObject var viewModel = CurrencyListViewModel()
  var saveCurrencyCode: ((_ currencyName: String, _ currencyCode: String) -> Void)
  
  var body: some View {
    HStack(alignment: .center) {

      Text("\(currency.name) - ")
        .font(.headline)
        .multilineTextAlignment(.leading)
      Text(currency.name.getCurrencyName() ?? "")
        .foregroundColor(.secondary)
      Spacer()
      Image(systemName: selected || viewModel.isSaving(code: currency.name) ? "checkmark.circle" : "plus.circle")
        .foregroundColor(.blue)
        .font(.system(size: 25))
        .onTapGesture {
          self.selected = true
          saveCurrencyCode(currency.name.getCurrencyName() ?? "", currency.name)
        }
    }
    .padding(6)
  }
}

// struct SymbolRow_Previews: PreviewProvider {
//  static var previews: some View {
//    SymbolRow(currency: CurrencyRate(name: "XOF", price: 124))
//  }
// }
