// ___FILEHEADER___

import Foundation

struct ___VARIABLE_productName___Usecase {
    var repository: ___VARIABLE_productName___Repository
    
    init(repository: ___VARIABLE_productName___Repository = ___VARIABLE_productName___RepositoryImpl(datasource: Datasource())) {
        self.repository = repository
    }
}
