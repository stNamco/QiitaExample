//
//  MainPresenter.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol MainView: class {
    func reloadTable()
}

final class MainPresenter {
    private weak var view: MainView!
    private(set) var props: MainViewController.Dependency!
    private let usecase: UserUsecase = UserUsecase(repository: DefaultUserRepository())
    private(set) var data: [User] = []

    init(view: MainView, dependency: MainViewController.Dependency) {
        self.view = view
        props = dependency
    }
}

extension MainPresenter {
    func fetch() {
        usecase.exec(target: .getUsers(page: 1, perPage: 5)) { [weak self] result in
            guard let this = self else {
                return
            }
            switch result {
            case .success(let res):
                this.data = res
                this.view.reloadTable()
            case .failure(let err):
                print(err)
            }
        }
    }
}
