//
//  User.swift
//  GitSwift
//
//  Created by tm on 2017/8/9.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import ObjectMapper

public class User: Object {
    
    var login: String?
    var name: String?
    var bio: String?
    var email: String?
    var avatar: String?
    var html: String?
    var blog: String?
    var company: String?
    var location: String?
    var collaborators: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        login <- map["login"]
        name <- map["name"]
        bio <- map["bio"]
        email <- map["email"]
        avatar <- map["avatar"]
        html <- map["html"]
        blog <- map["blog"]
        company <- map["company"]
        location <- map["location"]
        collaborators <- map["collaborators"]
    }
    
}
