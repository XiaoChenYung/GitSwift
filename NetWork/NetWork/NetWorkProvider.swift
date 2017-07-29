//
//  NetWorkProvider.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Domain

final class NetworkProvider {
    private let apiEndpoint: String
    
    public init() {
        apiEndpoint = "https://api.github.com"
    }
    
    public func makeUsersNetwork() -> UserNetwork {
        let network = NetWork<User>(apiEndpoint)
        return UserNetwork(network: network)
    }
}

