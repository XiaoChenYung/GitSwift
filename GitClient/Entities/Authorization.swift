//
//  Authorization.swift
//  GitSwift
//
//  Created by tm on 2017/8/9.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import ObjectMapper

public class Authorization: Object {
    
    var url: String?
    var token: String?
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        url <- map["url"]
        token <- map["token"]
    }
    
}
