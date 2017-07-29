//
//  UseCaseProvider.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/29.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    func makeAllUser() -> AllUserUseCase
}
