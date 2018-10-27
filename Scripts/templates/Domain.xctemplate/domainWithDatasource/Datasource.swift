// ___FILEHEADER___

import Foundation

final class Datasource: DatasourceAccesable {}

extension Datasource {
    func store(item: Codable) {
        print("save - \(item)")
    }
    
    func item(id: String) {
        print("get item - \(id)")
    }
    
    func items() {
        print("get items - ")
    }
    
    func items(with query: Query) {
    }
    
    func delete(id: String) {
        print("delete item - \(id)")
    }
}

// TODO: implement querybuilder. querybuilderかusecaseのどっちかでいいんじゃね。

final class Query: QueryBuilder {
}
