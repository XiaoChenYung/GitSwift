//
//  NetWork.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift
import ObjectMapper

final class NetWork<T: ImmutableMappable> {
    
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String) -> Observable<[T]> {
        let absolutePath = "\(endPoint)/\(path)"
        return operatorItems(.get, absolutePath)
    }
    
    func getItem(_ path: String, itemId: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return operatorItem(.get, absolutePath)
    }
    
    func postItem(_ path: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)"
        return operatorItem(.post, absolutePath, parameters: parameters)
    }
    
    func updateItem(_ path: String, itemId: String, parameters: [String: Any]) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return operatorItem(.put, absolutePath, parameters: parameters)
    }
    
    func deleteItem(_ path: String, itemId: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return operatorItem(.delete, absolutePath)
    }
    
    private func operatorItem(_ method: Alamofire.HTTPMethod,
                              _ url: URLConvertible,
                              parameters: [String: Any]? = nil,
                              headers: [String: String]? = nil)
        -> Observable<T> {
            var finalHeaders: [String: String]?
            if headers == nil {
                finalHeaders = ["Accept": "application/vnd.github.v3+json"]
            } else {
                finalHeaders = headers
                finalHeaders?["Accept"] = "application/vnd.github.v3+json"
            }
            
        return RxAlamofire
            .request(method, url, parameters: parameters, encoding: URLEncoding.default, headers: finalHeaders)
            .debug()
            .observeOn(scheduler)
            .map({ json -> T in
                return try Mapper<T>().map(JSONObject: json)
            })
    }
    
    private func operatorItems(_ method: Alamofire.HTTPMethod,
                              _ url: URLConvertible,
                              parameters: [String: Any]? = nil,
                              headers: [String: String]? = nil)
        -> Observable<[T]> {
            var finalHeaders: [String: String]?
            if headers == nil {
                finalHeaders = ["Accept": "application/vnd.github.v3+json"]
            } else {
                finalHeaders = headers
                finalHeaders?["Accept"] = "application/vnd.github.v3+json"
            }
            return RxAlamofire
                .json(method, url, parameters: parameters, encoding: URLEncoding.default, headers: finalHeaders)
                .debug()
                .observeOn(scheduler)
                .map({ json -> [T] in
                    return try Mapper<T>().mapArray(JSONObject: json)
                })
    }
}
