//
//  Injectable.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype Dependency
    func setterInjection(with dependency: Dependency)
}

protocol VCDependency {}
protocol VCInjectable: Injectable where Dependency: VCDependency {}
