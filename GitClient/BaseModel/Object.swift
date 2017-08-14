//
//  Object.swift
//  GitSwift
//
//  Created by tm on 2017/8/9.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

public class Object: Mappable {
    
    var objectID: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        objectID <- map["id"]
    }
    
}
