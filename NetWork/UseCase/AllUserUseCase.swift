//
//  AllUserUseCase.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class AllUserUseCase: Domain.AllUserUseCase {
    private let network: UserNetwork
    
    init(network: UserNetwork) {
        self.network = network
    }
    
    func users() -> Observable<[User]> {
        return network.fetchUsers()
    }
}
