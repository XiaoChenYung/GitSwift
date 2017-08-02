//
//  UseCaseProvider.swift
//  GitSwift
//
//  Created by tm on 2017/8/2.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeAllUserUseCase() -> Domain.AllUserUseCase {
        return AllUserUseCase(network: networkProvider.makeUsersNetwork())
    }
    
}
