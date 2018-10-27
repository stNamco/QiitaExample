// ___FILEHEADER___

import Foundation

protocol ___VARIABLE_productName___View: class {
}

final class ___VARIABLE_productName___Presenter {
    private weak var view: ___VARIABLE_productName___View!
    private(set) var props: ___VARIABLE_productName___ViewController.Dependency!
    
    init(view: ___VARIABLE_productName___View, dependency: ___VARIABLE_productName___ViewController.Dependency) {
        self.view = view
        props = dependency
        
        print("props \(props)")
    }
}
