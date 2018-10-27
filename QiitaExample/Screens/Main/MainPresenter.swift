//
//  MainPresenter.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol MainView: class {
}

final class MainPresenter {
    private weak var view: MainView!
    private(set) var props: MainViewController.Dependency!
    private let usecase: UserUsecase = UserUsecase(repository: DefaultUserRepository())

    init(view: MainView, dependency: MainViewController.Dependency) {
        self.view = view
        props = dependency
        
        print("props \(props)")

        usecase.exec(target: .test()) { (result) in
            print(result)
        }
    }
}
