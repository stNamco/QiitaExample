//
//  Error.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

public enum GeneralError: Swift.Error {
    case unknown(msg: String?)
    case instanceAlreadyReleased(Any?)
}

public enum APIError: Error {
    case network
    case server(Int)
    case parseError(String)
    case unknown(String)

    var message: String {
        switch self {
        case .network:
            return "network error"
        case .server(let status):
            return "error code \(status)"
        case .parseError(let entityName):
            return "failed to parse \(entityName)"
        case .unknown(let msg):
            return msg
        }
    }
}
