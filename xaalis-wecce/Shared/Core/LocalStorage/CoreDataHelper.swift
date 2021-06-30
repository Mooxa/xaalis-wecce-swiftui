//
  //  CoreDataHelper.swift
  //  xaalis-wecce
  //
  //  Created by Mouhamed Dieye on 30/06/2021.
  //

import Foundation
import CoreData

class CoreDataHelper: DBHelperProtocol {
  static let shared = CoreDataHelper()
  typealias ObjectType = NSManagedObject
  typealias PredicateType = NSPredicate
  let persistenceController = PersistenceController.shared
  var context: NSManagedObjectContext { persistenceController.container.viewContext }
  func create(_ object: NSManagedObject) {
    do {
      try context.save()
      print("Save successfully")
    } catch {
      fatalError("error saving context while creating an object")
    }
  }
func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, limit: Int? = nil)
  -> Result<[T], Error> {
    let request = objectType.fetchRequest()
    request.predicate = predicate
    if let limit = limit {
      request.fetchLimit = limit
    }
    do {
      let result = try context.fetch(request)
      return .success(result as? [T] ?? [])
    } catch {
      return .failure(error)
    }
  }
  func fetchFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
    let result = fetch(objectType, predicate: predicate, limit: 1)
    switch result {
    case .success(let results): return .success((results.first))
    case .failure(let error): return .failure(error)
    }
  }
  func update(_ object: NSManagedObject) {
    do {
      try context.save()
    } catch {
      fatalError("error saving context while updating an object")
    }
  }
}
