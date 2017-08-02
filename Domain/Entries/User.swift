//
//  User.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

public struct User {
    
    public let address: String
    public let company: String
    public let email: String
    public let name: String
    public let uid: Int
    public let username: String
    public let website: String
    
    public init(address: String,
                company: String,
                email: String,
                name: String,
                phone: String,
                uid: Int,
                username: String,
                website: String) {
        self.address = address
        self.company = company
        self.email = email
        self.name = name
        self.uid = uid
        self.username = username
        self.website = website
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.address == rhs.address &&
            lhs.company == rhs.company &&
            lhs.email == rhs.email &&
            lhs.name == rhs.name &&
            lhs.username == rhs.username &&
            lhs.website == rhs.website
    }
}
