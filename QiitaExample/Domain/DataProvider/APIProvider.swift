//
//  APIProvider.swift
//  QiitaExample
//
//  Created by stnamco on 2018/10/27.
//  Copyright © 2018年 namco. All rights reserved.
//

import Alamofire
import Foundation
import Moya

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

private func networkActivityClosure(_ change: NetworkActivityChangeType, target: TargetType) {}

private final class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForResource = 100
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

public let qiitaProvider = MoyaProvider<QiitaAPI>(
    endpointClosure: endpointClosure,
    manager: DefaultAlamofireManager.sharedManager,
    plugins: [
        NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter),
        NetworkActivityPlugin(networkActivityClosure: networkActivityClosure)
    ]
)

let endpointClosure = { (target: QiitaAPI) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    return defaultEndpoint.adding(newHTTPHeaderFields: ["Accept": "application/json", "Content-Type": "application/json"])
}

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
