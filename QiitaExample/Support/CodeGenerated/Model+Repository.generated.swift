// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
import Moya
import Result

// MARK: User Model

protocol UserRepository: RepositoryType {
    var datasource: DatasourceType { get }
}

final class DefaultUserRepository: UserRepository {

    public var datasource: DatasourceType
    public var dataProvider: MoyaProvider<QiitaAPI>

    init(dataProvider: MoyaProvider<QiitaAPI> = qiitaProvider, datasource: DatasourceType = RealmDatasource()) {
        self.datasource = datasource
        self.dataProvider = dataProvider
    }

    func store(item: Entity) {
        datasource.store(item: item)
    }

    func item(id: String) {
        datasource.item(id: id)
    }

    func items(target: QiitaAPI, completion: @escaping ((Result<[Entity], GeneralError>) -> Void)) {
        qiitaProvider.requestWithMapping(target, entity: User.self, entityType: .items) { [weak self] (result) in
        switch result {
            case .success(let res):
                res.items.forEach({ [weak self] (item) in
                    guard let this = self else {return}
                    this.datasource.store(item: item)
                })
                completion(.success(res.items))
            case .failure(let err):
                completion(.failure(GeneralError.unknown(msg: err.errorDescription)))
            }
        }
    }

    func delete(id: String) {
        datasource.delete(id: id)
    }
}

