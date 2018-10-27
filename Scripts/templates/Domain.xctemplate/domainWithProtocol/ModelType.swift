// ___FILEHEADER___

import Foundation
import Moya
import Result

typealias Entity = Codable
typealias ResultCompletion = (_ result: Result<ResultObject, MoyaError>) -> Void

protocol ResultType {
    associatedtype Object = Entity
    var response: Response { get set }
    var items: [Object] { get set }
}

struct ResultObject: ResultType {
    var response: Response
    var items: [Object]
}

enum EntityType {
    case item
    case items
}

extension MoyaProvider {
    @discardableResult
    func requestWithMapping<T: Entity>(_ target: Target, callbackQueue: DispatchQueue? = .none, progress: Moya.ProgressBlock? = .none, entity: T.Type, entityType: EntityType = .item, completion: @escaping ResultCompletion) -> Cancellable {
        return request(target) { result in
            
            switch result {
            case .success(let res):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    switch entityType {
                    case .item:
                        let data: T = try decoder.decode(T.self, from: res.data)
                        let result = ResultObject(response: res, items: [data])
                        completion(.success(result))
                    case .items:
                        let data: [T] = try decoder.decode([T].self, from: res.data)
                        let result = ResultObject(response: res, items: data)
                        completion(.success(result))
                    }
                } catch {
                    completion(.failure(MoyaError.jsonMapping(res)))
                }
                
            case .failure(let error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                print("error: \(error)")
                
                completion(.failure(error))
            }
        }
    }
}
