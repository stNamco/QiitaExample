//
//  QiitaAPI.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation
import Moya

public enum QiitaAPI {
    case users(page: Int, perPage: Int)
    case items(page: Int, perPage: Int)
}

extension QiitaAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
    
    public var path: String {
        switch self {
        case .users:
            return "/users"
        case .items:
            return "/items"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .users, .items:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .users(let page, let perPage):
            return ["page": page, "per_page": perPage]
        case .items(let page, let perPage):
            return ["page": page, "per_page": perPage]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        if let param = parameters {
            return .requestParameters(parameters: param, encoding: parameterEncoding)
        } else {
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return [:]
    }
}
