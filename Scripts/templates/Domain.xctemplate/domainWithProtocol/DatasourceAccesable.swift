// ___FILEHEADER___

import Foundation

protocol QueryBuilder {}

protocol DatasourceAccesable {
    associatedtype Query = QueryBuilder
    
    func store(item: Codable)
    func item(id: String)
    func items()
    func items(with query: Query)
    func delete(id: String)
}
