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
        address = try map.value("address")
        company = try map.value("company")
        email = try map.value("email")
        name = try map.value("name")
        uid = try map.value("id")
        username = try map.value("username")
        website = try map.value("website")
    }
}
