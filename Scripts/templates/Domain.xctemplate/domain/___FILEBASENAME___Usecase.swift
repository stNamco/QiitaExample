// ___FILEHEADER___

import Foundation
import Result

struct ___VARIABLE_productName___Usecase<T: ___VARIABLE_productName___Repository> {
    private var repository: T
    
    enum Target {
        case test()
    }
    
    init(repository: T) {
        self.repository = repository
    }
    
    func exec(target: ___VARIABLE_productName___Usecase.Target, completion: @escaping ((_ result: Result<[___VARIABLE_productName___], GeneralError>) -> Void)) {
        switch target {
        case .test():
            break
        }
    }
}

private extension ___VARIABLE_productName___Usecase {
	func test() {

	}
}