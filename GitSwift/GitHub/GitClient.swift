//
//  GitClient.swift
//  GitSwift
//
//  Created by tm on 2017/7/27.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON



/// 网络错误
struct NetError : Error {
    let domain: String
    let code: Int
    let message: String
    
    
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    var _message: String {
        return message
    }
}

enum NetMethod {
    case GET
    case POST
    case PUT
    case DELETE
}


class GitClient {
    
    static let client = GitClient()
    
    /// Base Request Method
    ///
    /// - Parameters:
    ///   - method: NetMethod
    ///   - url: relative url
    ///   - parameters: params
    ///   - encoding: ignore
    ///   - headers: headers
    /// - Returns: DataRequest
    func request(method: NetMethod,
                 url: String,
                 parameters: [String: Any]? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 headers: [String: String]? = nil) -> Observable<(Any)> {
        let tempURL = URL(string: GitBaseURL + url)
        guard let realURL = tempURL else {
            return Observable.error(NetError(domain: "URLError", code: 10011, message: "网络错误"))
        }
        return RxAlamofire.requestJSON(mapMethod(method: method), realURL, parameters: parameters, encoding: encoding, headers: headers)
            .flatMap { (r, json) in
                return Observable.just(json)
        }
    }
    
    func mapMethod(method: NetMethod) -> HTTPMethod {
        switch method {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        case .DELETE:
            return .delete
        }
    }
}
