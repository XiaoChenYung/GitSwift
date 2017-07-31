//
//  UserListViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/7/28.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Domain

class UserListViewModel {
    
    struct Input {
        let trigger: Driver<Void>
        let createPostTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
        let posts: Driver<[User]>
        let createPost: Driver<Void>
        let selectedPost: Driver<User>
        let error: Driver<Error>
    }
}
