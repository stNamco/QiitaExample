//
//  MainViewController.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, VCInjectable {
    struct Dependency: VCDependency {}
    var presenter: MainPresenter!
    
    func setterInjection(with dependency: MainViewController.Dependency) {
        presenter = MainPresenter(view: self, dependency: dependency)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setterInjection(with: .init())
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - Private

private extension MainViewController {
    func configure() {
    }
}

// MARK: - View

extension MainViewController: MainView {
}

// MARK: - Pubric

extension MainViewController {
}

// MARK: - Others

extension MainViewController {
}
