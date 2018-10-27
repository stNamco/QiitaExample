//
//  RealmDatasource.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

public final class RealmDatasource: DatasourceType {}

public extension RealmDatasource {
    public func store(item: Codable) {
        print("\(String(describing: type(of: self))): save - \(item)")
    }

    public func item(id: String) {
        print("\(String(describing: type(of: self))): get item - \(id)")
    }

    public func items() {
        print("\(String(describing: type(of: self))): get items - ")
    }

    public func items(with query: QueryBuilder) {
        print("\(String(describing: type(of: self))): get items with query - ")
    }

    public func delete(id: String) {
        print("\(String(describing: type(of: self))): delete item - \(id)")
    }
}

public final class RealmQuery: QueryBuilder {
}
