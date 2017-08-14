//
//  Cilent.swift
//  GitSwift
//
//  Created by tm on 2017/8/8.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire
import ObjectMapper

struct ClientRequest {
    
}

public class Client: NSObject {
    
    public static let client = Client()
    public var token: String?
    public var currentUser: User?
    public var isAuthorization: Bool {
        get {
            return self.token != nil
        }
    }
    private let defaultHeaders: HTTPHeaders = ["Accept":"application/vnd.github.v3+json"]
    
    private override init() {}
    
    public func login(username: String, password: String) -> Observable<Client> {
        
        //        RxAlamofire.request("https://api.github.com")
        
        let authorizationObservable: ((_ user: String, _ password: String) -> (Observable<Any>)) = { user, password in
                
                    
                    var headers = self.defaultHeaders
//                    headers["X-GitHub-OTP"] = password
                    //
                    if let authorizationHeader = Request.authorizationHeader(user: username, password: password) {
                        headers[authorizationHeader.key] = authorizationHeader.value
                    }
                    
                    let request = Alamofire.request("https://api.github.com/authorizations/clients/73d8c44f52cc65cd1a19",
                                                    method: .put,
                                                    parameters: ["scopes": ["user", "repo"],"client_secret":"3b43822f9e972d27d8a19af8e072a702d6167ba2"],
                                                    encoding: JSONEncoding.default,
                                                    headers: headers)
                    
                    
                    return self.clientRequest(request: request)
                }
        
        return authorizationObservable(username, password)
            .flatMap { [unowned self] (response) -> Observable<Client> in
                
                if let auth = Authorization(JSON: response as! [String: Any]) {
                    self.token = auth.token
                    //                let value = response.result.value
                    return Observable.just(self)
                } else {
                    return Observable.error(NSError(domain: "解析失败", code: 1, userInfo: nil))
                }
        }
        
    }
    
    private func clientRequest(request: DataRequest) -> Observable<Any> {
        
        
        return Observable.create({ observer -> Disposable in
            request.responseJSON(completionHandler: { response in
                
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                if response.response?.statusCode == 200 {
                    if response.result.value != nil {
                        observer.onNext(response.result.value!)
                        observer.onCompleted()
                    } else {
                        observer.onCompleted()
                    }
                    return
                }
                observer.onError(NSError(domain: "不支持的类型", code: 1, userInfo: nil))
//                observer.onCompleted()
            })
            return Disposables.create()
        })
        
    }
    
}
