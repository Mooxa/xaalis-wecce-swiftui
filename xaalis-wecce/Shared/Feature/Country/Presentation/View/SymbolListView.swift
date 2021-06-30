  //
  //  SymbolListView.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 21/06/2021.
  //

import SwiftUI

struct SymbolListView: View {
  @ObservedObject var viewModel = SymbolListViewModel()
  @State var selected: Bool  = false
  @Environment(\.presentationMode) var presentationMode
  @State private var searchText = ""

  var body: some View {
    NavigationView {
      List(searchResults, id: \.alpha3Code) { country in
        SymbolRow(country: country)
      }
      .task {
        viewModel.fetchCountry()
      }
      .refreshable {
        viewModel.fetchCountry()
      }
      .searchable(text: $searchText) {
        ForEach(searchResults, id: \.alpha3Code) { result in
          Text("Are you looking for \(result.name)?").searchCompletion(result.name)
        }
      }
      .navigationTitle("Choose Symbol")
      .navigationBarItems(trailing: Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
        Text("Save")
          .foregroundColor(.blue)
          .font(.system(size: 20))
          .padding()
      }))
    }
  }
  var searchResults: [Country] {
    if searchText.isEmpty {
      return viewModel.countries
    } else {
      return viewModel.countries.filter { $0.name.contains(searchText) }
    }
  }
}

struct SymbolListView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolListView()
  }
}
