//
//  ObservableSwiftJSON.swift
//  GitSwift
//
//  Created by tm on 2017/7/21.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

struct SwiftJSONError: Error {
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

public extension ObservableType where E == JSON {
    
    
    /// 转换单个对象
    ///
    /// - Parameter type: <#type description#>
    /// - Returns: <#return value description#>
    public func mapSwiftJSONObject<T: SwiftyJSONAble>(type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            guard let mappedObject = T(jsonData: response) else {
                throw SwiftJSONError(domain: "SwiftJSON", code: 101, message: "对象转换失败")
            }
            return Observable.just(mappedObject)
        }
    }
    
    public func mapSwiftJSONArray<T: SwiftyJSONAble>(type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            let mappedObjectArray = response.arrayValue.flatMap { T(jsonData: $0) }
            return Observable.just(mappedObjectArray)
        }
    }
}
