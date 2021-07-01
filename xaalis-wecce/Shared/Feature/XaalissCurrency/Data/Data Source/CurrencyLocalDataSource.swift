  //
  //  CurrencyLocalDataSource.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 01/07/2021.
  //

import Foundation
import CoreData

protocol CurrencyLocalDataSourceProtocol {
  func addCurrency(currencyName: String, currencyCode: String)
  func getOneCurrency(by code: String) -> CurrencyModel?
  func getAllLocalCurrency() -> [CurrencyModel]
}

final class CurrencyLocalDataSource: CurrencyLocalDataSourceProtocol {
  
  var dbHelper: CoreDataHelper = CoreDataHelper.shared
  
  func addCurrency(currencyName: String, currencyCode: String) {
    let entity = CurrencyModel.entity()
    let currencyModel = CurrencyModel(entity: entity, insertInto: dbHelper.context)
    currencyModel.name = currencyName
    currencyModel.code = currencyCode
    dbHelper.create(currencyModel)
  }
  
  func getOneCurrency(by code: String) -> CurrencyModel? {
    let predicate = NSPredicate(
      format: "code = %@", code)
    let result = dbHelper.fetchFirst(CurrencyModel.self, predicate: predicate)
    switch result {
    case .success(let currencies):
      return currencies
    case .failure(_):
      return nil
    }
  }

  func getAllLocalCurrency() -> [CurrencyModel] {
    let result = dbHelper.fetch(CurrencyModel.self)
    switch result {
    case .success(let currencies):
      return currencies
    case .failure(_):
      return []
    }
  }
}
