//
//  NetWork.swift
//  GitSwift
//
//  Created by tm on 2017/7/19.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift
import SwiftyJSON

let baseURL = "https://api.github.com/"

enum NetMethod {
    case GET
    case POST
}

func netRequest(methodsss: NetMethod = .GET, url: String, params: [String: Any]) ->  Observable<JSON> {
    
    return requestJSON(.get, baseURL + url, parameters: params).flatMap { (res, response) -> Observable<JSON> in
        return Observable.just(JSON(response))
    }
}
