//
//  RepositoryType.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation
import Moya
import Result

public protocol RepositoryType {
    var datasource: DatasourceType { get }
    var dataProvider: MoyaProvider<QiitaAPI> { get }
    func store(item: Entity)
    func item(id: String)
    func items(target: QiitaAPI, completion: @escaping ((_ result: Result<[Entity], GeneralError>) -> Void))
    func delete(id: String)
}
