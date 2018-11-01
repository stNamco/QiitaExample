//
//  DetailViewController.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/30.
//  Copyright © 2018年 namco. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, VCInjectable {
    struct Dependency: VCDependency {}
    var presenter: DetailPresenter!

    func setterInjection(with dependency: DetailViewController.Dependency) {
        presenter = DetailPresenter(view: self, dependency: dependency)
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

private extension DetailViewController {
    func configure() {
    }
}

// MARK: - View

extension DetailViewController: DetailView {
}

// MARK: - Pubric

extension DetailViewController {
}

// MARK: - Others

extension DetailViewController {
}
