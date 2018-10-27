// ___FILEHEADER___

import Foundation
import Moya

protocol ___VARIABLE_productName___Repository: RepositoryType {
    var datasource: Datasource { get }
}

final class ___VARIABLE_productName___RepositoryImpl: ___VARIABLE_productName___Repository {
    var datasource: Datasource
    var dataProvider: MoyaProvider<TargetType>
    
    init(dataProvider: MoyaProvider<TargetType> = apiProvider, datasource: Datasource) {
        self.datasource = datasource
        self.dataProvider = dataProvider
    }
    
    func store(item: Entity) {
        datasource.store(item: item)
    }
    
    func item(id: String) {
        datasource.item(id: id)
    }
    
    func items(target: TargetType completion: @escaping ResultCompletion) {
        dataProvider.requestWithMapping(target, entity: ___VARIABLE_productName___.self, entityType: .items) { [weak self] result in
            switch result {
            case .success(let res):
                res.items.forEach({ [weak self] item in
                    guard let this = self else { return }
                    this.datasource.store(item: item)
                })
                print(res)
                completion(.success(res))
            case .failure(let err):
                print(err)
                completion(.failure(err))
            }
        }
    }
    
    func delete(id: String) {
        datasource.delete(id: id)
    }
}
