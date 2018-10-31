//
//  MainViewController.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, VCInjectable {
    @IBOutlet var tableView: UITableView!

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
        tableView.dataSource = self
        tableView.delegate = self
        presenter.fetch()
    }
}

// MARK: - View

extension MainViewController: MainView {
    func reloadTable() {
        tableView.reloadData()
    }
}

// MARK: - Pubric

extension MainViewController {
}

// MARK: - Others

extension MainViewController {



    
}

// MARK: - UIT

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.data[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = item.id
        return cell
    }
}

// MARK: - UIT

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap: \(indexPath.row)")
    }
}
