// ___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___ViewController: UIViewController, VCInjectable {
    struct Dependency: VCDependency {}
    var presenter: ___VARIABLE_productName___Presenter!

    func setterInjection(with dependency: ___VARIABLE_productName___ViewController.Dependency) {
        presenter = ___VARIABLE_productName___Presenter(view: self, dependency: dependency)
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

private extension ___VARIABLE_productName___ViewController {
    func configure() {
    }
}

// MARK: - View

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___View {
}

// MARK: - Pubric

extension ___VARIABLE_productName___ViewController {
}

// MARK: - Others

extension ___VARIABLE_productName___ViewController {
}
