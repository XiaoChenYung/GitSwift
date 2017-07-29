//
//  UserNetWork.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Domain
import RxSwift

public final class UserNetwork {
    
    private let network: NetWork<User>
    
    init(network: NetWork<User>) {
        self.network = network
    }
    
    public func fetchUsers() -> Observable<[User]> {
        return network.getItems("users")
    }
    
    public func fetchUser(userId: String) -> Observable<User> {
        return network.getItem("users", itemId: userId)
    }
}
