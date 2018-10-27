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
        case getUsers(page: Int, perPage: Int)
    }
    
    init(repository: T) {
        self.repository = repository
    }
    
    func exec(target: UserUsecase.Target, completion: @escaping ((_ result: Result<[User], GeneralError>) -> Void)) {
        switch target {
        case .test:
            test()
        case .getUsers(let page, let perPage):
            getUsers(page: page, perPage: perPage, completion: completion)
        }
    }
}

private extension UserUsecase {
    func test() {
        print("test")
    }

    func getUsers(page: Int, perPage: Int, completion: @escaping ((_ result: Result<[User], GeneralError>) -> Void)) {
        repository.items(target: .users(page: page, perPage: perPage)) { result in
            switch result {
            case .success(let res):
                print(res)
                guard let items = res as? [User] else {
                    return
                }
                completion(.success(items))
            case .failure(let err):
                print(err)
                completion(.failure(err))
            }
        }
    }
}
