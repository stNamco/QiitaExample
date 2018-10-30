// 
//  DetailPresenter.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/30.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol DetailView: class {
}

final class DetailPresenter {
    private weak var view: DetailView!
    private(set) var props: DetailViewController.Dependency!
    
    init(view: DetailView, dependency: DetailViewController.Dependency) {
        self.view = view
        props = dependency
        
        print("props \(props)")
    }
}
