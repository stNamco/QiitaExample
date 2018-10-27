//
//  DatasourceType.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

public protocol QueryBuilder {}

public protocol DatasourceType {
    func store(item: Codable)
    func item(id: String)
    func items()
    func items(with query: QueryBuilder)
    func delete(id: String)
}
