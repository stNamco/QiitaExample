// ___FILEHEADER___

import Foundation
import Moya
import Result

protocol RepositoryType {
    var datasource: Datasource { get }
    var dataProvider: MoyaProvider<TargetType> { get }
    func store(item: Entity)
    func item(id: String)
    func items(target: QiitaAPI, completion: @escaping ResultCompletion)
    func delete(id: String)
}
