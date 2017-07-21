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
    request(<#T##method: HTTPMethod##HTTPMethod#>, <#T##url: URLConvertible##URLConvertible#>)
    
}
