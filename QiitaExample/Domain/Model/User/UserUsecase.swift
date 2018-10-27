//
//  UserUsecase.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation
import Result

struct UserUsecase<T: UserRepository> {
    private var repository: T
    
    enum Target {
        case test()
    }
    
    init(repository: T) {
        self.repository = repository
    }
    
    func exec(target: UserUsecase.Target, completion: @escaping ((_ result: Result<[User], GeneralError>) -> Void)) {
        switch target {
        case .test():
            break
        }
    }
}

private extension UserUsecase {
    func test() {
    }
}
