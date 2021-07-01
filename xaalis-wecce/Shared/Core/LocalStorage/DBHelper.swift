//
//  DBHelper.swift
//  xaalis-wecce
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

public protocol DBHelperProtocol {
    associatedtype ObjectType
    associatedtype PredicateType
    func create(_ object: ObjectType)
    func fetchFirst(_ objectType: ObjectType.Type, predicate: PredicateType?) -> Result<ObjectType?, Error>
    func fetch(_ objectType: ObjectType.Type, predicate: PredicateType?, limit: Int?) -> Result<[ObjectType], Error>
    func update(_ object: ObjectType)
}
