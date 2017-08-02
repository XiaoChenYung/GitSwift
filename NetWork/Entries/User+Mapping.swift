//
//  User+Mapping.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Domain
import ObjectMapper

extension User: ImmutableMappable {
    
    // JSON -> Object
    public init(map: Map) throws {
        address = try map.value("avatar_url")
        company = try map.value("login")
        email = try map.value("login")
        name = try map.value("login")
        uid = try map.value("id")
        username = try map.value("login")
        website = try map.value("html_url")
    }
}
